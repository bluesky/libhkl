#!/usr/bin/env python

from hkl import SimulatedApsPolar
from hkl.util import libhkl

default_units = libhkl.UnitEnum.DEFAULT.real
user_units = libhkl.UnitEnum.USER.real

polar = SimulatedApsPolar('', name='polar'); polar.wh()
print(f"{len(polar.calc.engines)=}  {polar.calc.engines=}")
print(f"{len(polar.calc.engine.modes)=}  {polar.calc.engine.modes=}")

polar.calc.engine.mode = "psi constant horizontal"
print(f"{len(polar.calc.engine.parameters)=}  {polar.calc.engine.parameters=}")
polar.calc.engine.engine.parameters_names_get()

psi_parameter = polar.calc.engine.engine.parameter_get("psi")
print(f"{psi_parameter=}")
print(f"{dir(psi_parameter)=}")
print(f"{psi_parameter.value_get(default_units)=} {psi_parameter.value_get(user_units)=}")

print('set "psi" to 0.1 radians')
psi_parameter.value_set(0.1, 0)
print(f"{psi_parameter.value_get(default_units)=} {psi_parameter.value_get(user_units)=}")

print('set "psi" to 10 degrees')
psi_parameter.value_set(10, 1)
print(f"{psi_parameter.value_get(default_units)=} {psi_parameter.value_get(user_units)=}")

print('Expect these to be the same but they are not.  Why?')
# print(f"{polar.calc.engine.parameters_values[-1]=}  {psi_parameter.value_get(user_units)=}")
print(f"{polar.engine.engine.parameters_values_get(user_units)[-1]=}  {psi_parameter.value_get(user_units)=}")
