import os
import json
from graph import graph

to_include = ["ADD","ADDI"]

builder = graph()
reference = {}

for i in to_include:
    file_p = os.path.abspath(os.path.dirname(__file__))
    in_inst = json.load(open(os.path.join(file_p,"../data/"+i+".json")))
    if in_inst["type"] not in reference:
        reference[in_inst["type"]] = graph(json.load(open(os.path.join(file_p,"../data/"+in_inst["type"]+".json"))))
    reference[in_inst["type"]].add_inst(in_inst)

for i in reference:
    builder.merge(reference[i])
