import os
from pathlib import Path
import json
import numpy as np
import matplotlib.pyplot as plt
import argparse
import copy

# Counts intructions used in .s file (assembly code) and creates bar chart
# ATM we can use to get a better idea of how sample programs use instructions
# to be used in the future as the basis for picking which instructions to include in the application specific cpu implementation
class parser:
	def __init__(self,file):
		self.path = Path.resolve(Path('.'))
		self.file = file
		with open(self.path / file, 'r') as in_file:
			in_data = in_file.read().split()
			with open(self.path.parent / "insts.json", 'r') as in_json: # count instructions from JSON file listing all RISC-V instructions
				self.res = {}
				json_data = json.load(in_json)
				for i in json_data['instructions']:
					for j in i["insts"]:
						self.res[j.lower()] = in_data.count(j.lower())

		self.out = copy.deepcopy(self.res)
		for k, v in self.res.copy().items(): # remove from list unused instructions
			if v == 0:
				del self.out[k]
	
	def get_insts(self):
		return self.out

	def print_ratio(self):
		ratio = round(len(self.out)/len(self.res) * 100, 2)
		print("used " + str(ratio) + "% of instructions in", self.file)
		return ratio

	def plot(self):
		plt.bar(list(self.out.keys()), list(self.out.values())) # make bar chart
		plt.xticks(rotation="vertical")
		self.print_ratio()
		plt.savefig(self.path / (self.file + ".bar.jpg"))
		plt.show()

arg_parser = argparse.ArgumentParser()
arg_parser.add_argument("-f", required=True, nargs='+')
arg_parser.add_argument("-b", action='store_const', const=True, default=False)
arg = arg_parser.parse_args()

acc = 0
for i in arg.f:
	par = parser(i)
	acc += par.print_ratio()
	if arg.b:
		par.plot()

print("Average for all programs", str(round(acc/len(arg.f),2)) + "%", "instruction used")
