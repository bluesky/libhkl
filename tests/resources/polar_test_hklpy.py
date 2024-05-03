"""Test APS POLAR Diffractometer with hklpy."""

import hkl
import json

TEST_ORIENTATION_FILE = "/home/orientation.json"

polar = hkl.SimulatedApsPolar("", name="polar")
polar.pa()

with open(TEST_ORIENTATION_FILE, "r") as f:
    config = json.loads(f.read())

config["geometry"] = polar.geometry_name.get()  # "APS POLAR"
agent = hkl.DiffractometerConfiguration(polar)
agent.restore(config)
polar.pa()
