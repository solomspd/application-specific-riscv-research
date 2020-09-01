import os
import json
import numpy as np
import matplotlib.pyplot as plt

# Counts intructions used in .s file (assembly code) and creates bar chart
# ATM we can use to get a better idea of how sample programs use instructions
# to be used in the future as the basis for picking which instructions to include in the application specific cpu implementation

path = os.path.abspath(os.path.join(os.path.dirname(__file__), os.pardir))
with open(os.path.join(path, "riscv code", "riscv_sample.s"), "rt") as in_file:
	in_data = in_file.read().split()
	with open(os.path.join(path, "insts.json"), "r") as in_json: # count instructions from JSON file listing all RISC-V instructions
		res = dict()
		json_data = json.load(in_json)
		for i in json_data['instructions']:
			for j in i["insts"]:
				res[j.lower()] = in_data.count(j.lower())

out = res
for k, v in res.copy().items(): # remove from list unused instructions
	if v == 0:
		del out[k]

plt.bar(list(res.keys()), list(res.values())) # make bar chart
print("used " + str(len(out)/len(res)) + "% of instructions")
plt.show()