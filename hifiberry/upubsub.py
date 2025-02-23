import json
import socket
import os
import logging

log = logging.getLogger(__name__)

SERVER_ADDR = "/tmp/spubsub.sock"
MAX_SIZE = 10 ** 6  # 1MB
BACKLOG = 100

# only a single subscriber/server. Single message per connection.
def listen():
    # remove if exists (will do if restarted)
    try:
        os.unlink(SERVER_ADDR)
    except OSError:
        if os.path.exists(SERVER_ADDR):
            raise

    sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    sock.bind(SERVER_ADDR)
    sock.listen(BACKLOG)

    while True:
        con, addr = sock.accept()
        try:
            data = drain(con).decode()
            channel, payload = data.split(":", 1)
            try:
                obj = json.loads(payload)
            except json.JSONDecodeError:
                log.warn("Received invalid packet")

            yield channel, obj
        finally:
            con.close()


def publish(channel, obj):
    if ":" in channel:
        raise ValueError("Channel may not contain colon")

    payload = json.dumps(obj).encode()

    if len(payload) > MAX_SIZE:
        raise ValueError("Payload too large in JSON representation")

    data = bytearray("", "utf-8")
    data.extend((channel + ":").encode())
    data.extend(payload)

    try:
        sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
        sock.connect(SERVER_ADDR)
        sock.sendall(data)
    except BaseException:
        log.exception("Could not publish to channel. Is server listening?")
    finally:
        sock.close()


def drain(con):
    data = bytearray()

    while len(data) < MAX_SIZE:
        packet = con.recv(4096)

        if not packet:
            break

        data.extend(packet)

    return data
