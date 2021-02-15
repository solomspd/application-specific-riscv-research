import sys
import os
import json
from parser import parser
from builder import builder
import ModLib as mdl
import DPlib as dpl

app_inst = parser("/data/Abdo/Abdo/Abdos University work/spring 2020/Research/src/riscv code/test.s")

cpu = builder(["ADD","ADDI"])
cpu.to_json()

mdl.generateModules(cpu.get_built())
path = os.path.abspath(os.path.join(os.path.dirname(__file__), os.pardir))
with open(os.path.join(path, "data", "mux.json"), "r") as ctrl_layout:
	ctrl_layout=json.load(ctrl_layout)
	dpl.generateDatapath(cpu.get_built(), ctrl_layout)
