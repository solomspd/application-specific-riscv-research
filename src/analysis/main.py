import json
from analysis import graph

to_include = ["ADD","ADDI"]

builder = graph()
reference = {}

for i in to_include:
    in_inst = json.load(open("../"+i+".json"))
    if reference[in_inst["type"]] is None:
        reference[in_inst["type"]] = graph(json.load(open("../"+in_inst.type+".json")))
    reference[in_inst["type"]].add_isnt(in_inst)

for i in reference:
    builder.merge(i)
