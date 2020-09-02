import os
import json
import numpy as np
import matplotlib.pyplot as plt

# Counts intructions used in .s file (assembly code) and creates bar chart
# ATM we can use to get a better idea of how sample programs use instructions
# to be used in the future as the basis for picking which instructions to include in the application specific cpu implementation
class parser:
	def __init__(self,file):
		with open(file, "r") as in_file:
			in_data = in_file.read().split()
			with open(os.path.join(os.path.dirname(__file__), os.pardir, "insts.json"), "r") as in_json: # count instructions from JSON file listing all RISC-V instructions
				self.res = dict()
				json_data = json.load(in_json)
				for i in json_data['instructions']:
					for j in i["insts"]:
						self.res[j.lower()] = in_data.count(j.lower())

		self.out = self.res
		for k, v in self.res.copy().items(): # remove from list unused instructions
			if v == 0:
				del out[k]
	
	def get_insts(self):
		return self.out

	def plot(self):
		plt.bar(list(self.res.keys()), list(self.res.values())) # make bar chart
		print("used " + str(len(self.out)/len(self.res)) + "% of instructions")
		plt.show()