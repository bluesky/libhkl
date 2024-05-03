"""Test APS POLAR support."""

import gi  # gobject-introspection, to access libhkl
import json
import pyRestTable

gi.require_version("Hkl", "5.0")
from gi.repository import Hkl as libhkl

TEST_DIFFRACTOMETER = "APS POLAR"
TEST_ENGINE = "hkl"
TEST_ORIENTATION_FILE = "orientation.json"
TEST_SAMPLE = "Si"

DETECTOR = libhkl.Detector.factory_new(libhkl.DetectorType(0))
FACTORY = libhkl.factories()[TEST_DIFFRACTOMETER]
ENGINE = FACTORY.create_new_engine_list().engine_get_by_name(TEST_ENGINE)
GEOMETRY = FACTORY.create_new_geometry()
SAMPLE = libhkl.Sample.new("")
USER_UNITS = libhkl.UnitEnum.USER


def add_reflection(ref):
    hkl = tuple(ref["position"].values())
    positions = ref["reflection"].values()
    GEOMETRY.axis_values_set(hkl, USER_UNITS)
    GEOMETRY.wavelength_set(ref["wavelength"], USER_UNITS)
    return SAMPLE.add_reflection(GEOMETRY, DETECTOR, *positions)


def add_sample(input_sample):
    # sample (from JSON file)
    print(f"######## {input_sample['name']} ########")
    set_lattice(input_sample["lattice"])

    input_reflections = input_sample["reflections"]
    nref = len(input_reflections)
    table = pyRestTable.Table()
    table.labels = ["name"] + [f"r{i+1}" for i in range(nref)]
    table.addRow(["use?"] + [r["orientation_reflection"] for r in input_reflections])
    for k in orientations["reciprocal_axes"]:
        table.addRow([k] + [r["reflection"][k] for r in input_reflections])
    for k in orientations["real_axes"]:
        table.addRow([k] + [r["position"][k] for r in input_reflections])
    table.addRow(["wavelength"] + [r["wavelength"] for r in input_reflections])
    print("Sample reflections from orientations file.")
    print(table)

    # restore orientation from JSON file.
    reflections = [
        add_reflection(ref)
        for ref in input_reflections
        if ref["orientation_reflection"]
    ]

    def report_UB(title, m_hkl, m_in):
        table = pyRestTable.Table()
        table.labels = "i,j hkl1 hkl2 hkl3 . in1 in2 in3".split()
        for i in range(3):
            row = [i]
            for j in range(3):
                row.append(f"{m_hkl[i][j]:.6f}")
            row.append(" ")
            for j in range(3):
                row.append(f"{m_in[i][j]:.6f}")
            table.addRow(row)
        print(f"===== {title} =====")
        print(table)

    if len(reflections) == 2:
        r1, r2 = reflections
        print("Calculating U & UB matrices with these reflections:")
        print(f"r1 = {r1.hkl_get()}")
        print(f"r2 = {r2.hkl_get()}")
        print()
        report_UB("U", calc_U(r1, r2), input_sample["U"])
        report_UB("UB", calc_UB(r1, r2), input_sample["UB"])


def calc_U(r1, r2):
    SAMPLE.compute_UB_busing_levy(r1, r2)
    m = SAMPLE.U_get()
    matrix = [[m.get(i, j) for j in range(3)] for i in range(3)]
    return matrix


def calc_UB(r1, r2):
    SAMPLE.compute_UB_busing_levy(r1, r2)
    m = SAMPLE.UB_get()
    matrix = [[m.get(i, j) for j in range(3)] for i in range(3)]
    return matrix


def remove_reflection(ref):
    SAMPLE.del_reflection(ref)


def set_lattice(input_lattice):
    lattice = SAMPLE.lattice_get()
    for k in "a b c alpha beta gamma".split():
        p = getattr(lattice, f"{k}_get")()
        p.value_set(input_lattice[k], USER_UNITS)
        getattr(lattice, f"{k}_set")(p)
    SAMPLE.lattice_set(lattice)

    table = pyRestTable.Table()
    table.labels = "parameter value".split()
    lattice = SAMPLE.lattice_get()
    for k in "a b c alpha beta gamma".split():
        p = getattr(lattice, f"{k}_get")()
        table.addRow((k, f"{p.value_get(0):.6f}"))
    print(table)


with open(TEST_ORIENTATION_FILE, "r") as f:
    orientations = json.loads(f.read())

add_sample(orientations["samples"][TEST_SAMPLE])
