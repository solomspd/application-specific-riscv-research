import os
import json
from graph import graph

class builder:

	reference = {}

	def __init__(self, insts):
		self.builder = graph()
		self.to_include = insts


	def create_reference(self):
		for i in self.to_include:
			file_p = os.path.abspath(os.path.dirname(__file__))
			with open(os.path.join(file_p,"../data/"+i+".json")) as template_file:
				in_inst = json.load(template_file)
				if in_inst["type"] not in self.reference:
					with open(os.path.join(file_p,"../data/"+in_inst["type"]+".json")) as inst_file:
						self.reference[in_inst["type"]] = graph(json.load(inst_file))
				self.reference[in_inst["type"]].add_inst(in_inst)

	def build(self):
		for i in reference:
			self.builder.merge(reference[i])

	def get_built(self):
		return self.builder
	
	def to_json(self):
		print(json.dumps(self.builder.to_json()))
		with open("temp.json","w+") as f:
			f.write(json.dumps(self.builder.to_json()))