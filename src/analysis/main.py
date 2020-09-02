import sys
from parser import parser
from builder import builder

app_inst = parser(sys.argv[1])

cpu = builder(app_inst.get_insts())

cpu.to_json()