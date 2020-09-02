import parser
from builder import builder


cpu = builder(["ADD","ADDI"])

cpu.to_json()