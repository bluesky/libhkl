"""Test that libhkl pre-built support is available in Python."""

import gi  # gobject-introspection, to access libhkl
gi.require_version("Hkl", "5.0")
from gi.repository import Hkl as libhkl

# access some content
assert "VERSION" in dir(libhkl)
print(f"{libhkl.VERSION=}")

diffractometer_types = libhkl.factories()
assert isinstance(diffractometer_types, dict)
assert 5 < len(diffractometer_types) < 30
for i, dt in enumerate(sorted(diffractometer_types), start=1):
    print(f"{i}\t{dt}")

UserUnits = libhkl.UnitEnum.USER
assert UserUnits is not None

DefaultUnits = libhkl.UnitEnum.DEFAULT
assert DefaultUnits is not None

TEST_GEOMETRY = "APS POLAR"
TEST_AXIS_LIST = "mu omega chi phi delta gamma".split()
TEST_ENGINE = "hkl"
TEST_MODES = """
4-circles constant phi horizontal
zaxis + alpha-fixed
zaxis + beta-fixed
zaxis + alpha=beta
4-circles bissecting horizontal
4-circles constant omega horizontal
4-circles constant chi horizontal
lifting detector mu
lifting detector omega
lifting detector chi
lifting detector phi
psi constant
psi constant vertical
psi constant horizontal
""".strip().splitlines()

factory = diffractometer_types[TEST_GEOMETRY]
engine_list = factory.create_new_engine_list()
engine_names = [e.name_get() for e in engine_list.engines_get()]
assert TEST_ENGINE in engine_names
engine = engine_list.engine_get_by_name(TEST_ENGINE)
assert engine.modes_names_get() == TEST_MODES, f"{engine.modes_names_get()=}"

geometry = factory.create_new_geometry()
assert geometry.axis_names_get() == TEST_AXIS_LIST
