<<<<<<< HEAD
import os
import json
from graph import graph

to_include = ["ADD","ADDI"]

builder = graph()
reference = {}

for i in to_include:
    file_p = os.path.abspath(os.path.dirname(__file__))
    with open(os.path.join(file_p,"../data/"+i+".json")) as template_file:
        in_inst = json.load(template_file)
        if in_inst["type"] not in reference:
            with open(os.path.join(file_p,"../data/"+in_inst["type"]+".json")) as inst_file:
                reference[in_inst["type"]] = graph(json.load(inst_file))
        reference[in_inst["type"]].add_inst(in_inst)

for i in reference:
    builder.merge(reference[i])
=======
import parser
from builder import builder


cpu = builder(["ADD","ADDI"])
>>>>>>> solom
