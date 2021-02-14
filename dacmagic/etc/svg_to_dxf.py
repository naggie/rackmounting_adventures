#!/usr/bin/env python
# svg_to_dxf.py

"""

Convert SVG to DXF that uses a polyline.
By Rudolf Cardinal, 19 Sep 2019.
http://www.apache.org/licenses/LICENSE-2.0

Problem with prototype: lots of lines, not joined up, crashes their DXF
software. See
https://graphicdesign.stackexchange.com/questions/76534/automatically-merge-overlapping-nodes-in-inkscape.

The SVG is correct; about 78 "M" commands (move to) and loads of "L" (line
to) commands, within a single ``<path d="..." stroke="..." .../>`` element.

SVG path syntax:

- https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Paths

The DXF syntax is at

- https://images.autodesk.com/adsk/files/autocad_2012_pdf_dxf-reference_enu.pdf
- https://people.bath.ac.uk/ps281/teaching/maths3c/2DPinned_07_WritingDXFs.pdf

In DXF, a LINE command looks like:

.. code-block:: none

      0       # object type follows
    LINE      # object is a line
      8       # layer name follows
    0
     10       # Start X coordinate follows
    132.729
     20       # Start Y coordinate follows
    569.049
     11       # End X coordinate follows
    132.754
     21       # End Y coordinate follows
    569.066

Do they want a POLYLINE, or LWPOLYLINE?

See:

- http://forum.openscad.org/using-polylines-for-DXF-export-td5264.html
- https://github.com/openscad/openscad/pull/448

So, we want to be able to convert the good SVG to a DXY using POLYLINE or
LWPOLYLINE or similar.

DXF libraries include:

- ezdxf: https://ezdxf.mozman.at/relationship-dxfwrite-dxfgrabber-ezdxf.html;
  https://ezdxf.readthedocs.io/ -- this looks good
- sdxf: http://www.kellbot.com/sdxf-python-library-for-dxf/

DXF viewers include:

- LibreCAD -- iffy, or at least doesn't display files that the next does;
- https://beta.sharecad.org/ -- looks good

SVG libraries include:

- https://github.com/mathandy/svgpathtools

  - However, the function :func:`svgpathtools.svg2paths` seems to provide
    additional spurious lines (though not always) when it should be "jumping"
    between pieces. Not sure if this is a failure to discriminate between ``M``
    (move to) and ``L`` (line to) explicitly. -- Yes, I think sometimes it is.

  - Discarded; that's useless.

- https://github.com/regebro/svg.path

  - Much better!

"""

import argparse
import logging
from xml.dom import minidom
from xml.dom.minidom import Element
from typing import Generator, Iterable, List, Tuple

from cardinal_pythonlib.logs import main_only_quicksetup_rootlogger  # pip install cardinal-pythonlib==1.0.58  # noqa
import ezdxf  # pip install ezdxf==0.10.1

from svg.path.parser import parse_path  # pip install svg.path==3.0
from svg.path.path import Line, Move, Path

log = logging.getLogger(__name__)

DEFAULT_DXF_VERSION = "R2000"


# =============================================================================
# SVG element processing
# =============================================================================

def gen_svg_path_strings(svg_filename: str) -> Generator[str, None, None]:
    """
    Generates ``path`` data strings from an SVG file.
    """
    # https://stackoverflow.com/questions/15857818/python-svg-parser
    log.info(f"Reading SVG: {svg_filename!r}")
    doc = minidom.parse(svg_filename)
    for path in doc.getElementsByTagName("path"):  # type: Element
        yield path.getAttribute("d")
    doc.unlink()


def gen_svg_paths(path_strings: Iterable[str]) -> Generator[Path, None, None]:
    """
    Generates :class:`Path` objects from SVG path strings.
    """
    n_ps = 0
    for path_string in path_strings:
        n_ps += 1
        yield parse_path(path_string)
    log.debug(f"Number of path strings: {n_ps}")


def gen_points(path: Path) -> Generator[Tuple[float, float, bool], None, None]:
    """
    Iterates through points in a path and yields them.

    Yields:
        x: float, y: float, reset: bool
    """
    n_points = 0
    for x in path:
        n_points += 1
        # log.debug(repr(x))
        point = x.end  # type: complex
        if isinstance(x, Move):
            yield point.real, point.imag, True
        elif isinstance(x, Line):
            yield point.real, point.imag, False
        else:
            raise ValueError(f"Unknown path element: {x!r}")
    log.debug(f"Number of points: {n_points}")


def gen_polyline_points(paths: Iterable[Path]) \
        -> Generator[List[Tuple[float, float]], None, None]:
    """
    Generates points in polyline groups, one polyline per yield.
    """
    n_paths = 0
    for path in paths:
        n_paths += 1
        points = []  # type: List[Tuple[float, float]]
        for x, y, reset in gen_points(path):
            if reset:
                if points:
                    yield points
                points = []
            points.append((x, y))
        if points:
            yield points
    log.debug(f"Number of paths: {n_paths}")


# =============================================================================
# Master function
# =============================================================================

def svg_to_dxf(input_filename: str,
               output_filename: str,
               dxf_version: str = DEFAULT_DXF_VERSION,
               only_polylines: List[int] = None) -> None:
    """
    Converts an SVG file to DXF.

    Limited functionality!

    - SVG ``path`` (with ``M``, ``L``) to DXF ``LWPOLYLINE``.
    """
    only_polylines = only_polylines or []  # type: List[int]
    if only_polylines:
        log.warning(f"Restricting to polylines: {only_polylines}")

    log.info("Creating DXF document")
    doc = ezdxf.new(dxfversion=dxf_version)
    msp = doc.modelspace()

    path_string_gen = gen_svg_path_strings(input_filename)
    path_gen = gen_svg_paths(path_string_gen)
    points_gen = gen_polyline_points(path_gen)
    polyline_num = 0
    for points in points_gen:
        polyline_num += 1
        if only_polylines and polyline_num not in only_polylines:
            continue
        msp.add_lwpolyline(points)

    log.debug(f"{polyline_num} polylines found")
    log.info(f"Writing to {output_filename!r}")
    doc.saveas(output_filename)


# =============================================================================
# Command-line entry point
# =============================================================================

def main() -> None:
    """
    Command-line entry point.
    """
    parser = argparse.ArgumentParser(
        formatter_class=argparse.ArgumentDefaultsHelpFormatter
    )
    parser.add_argument(
        "inputfile", type=str,
        help="Input SVG filename"
    )
    parser.add_argument(
        "outputfile", type=str,
        help="Output DXF filename"
    )
    parser.add_argument(
        "--dxf_version", type=str, default=DEFAULT_DXF_VERSION,
        help="AutoCAD DXF version (passed to ezdxf); see "
             "https://ezdxf.readthedocs.io/en/master/introduction.html#supported-dxf-versions"  # noqa
    )
    parser.add_argument(
        "--only_polylines", type=int, nargs="*", default=[],
        help="[Debug option] Write only the n-th polyline(s). "
             "Specify one or more positive integers."
    )
    args = parser.parse_args()
    svg_to_dxf(
        input_filename=args.inputfile,
        output_filename=args.outputfile,
        dxf_version=args.dxf_version,
        only_polylines=args.only_polylines,
    )


if __name__ == "__main__":
    main_only_quicksetup_rootlogger()
    main()
