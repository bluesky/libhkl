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
