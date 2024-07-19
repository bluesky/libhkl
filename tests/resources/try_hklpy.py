"""Test that hklpy works."""

import hkl

print(f"{hkl.__version__=}")
print(f"{hkl.geometries.__all__=}")

e4cv = hkl.SimulatedE4CV("", name="e4cv")
print(f"{e4cv.position=}")
print(f"{e4cv.pa()=}")

print("All tests finished successfully.")
