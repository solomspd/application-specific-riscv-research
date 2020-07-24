import analysis.v_module
class graph:

	modules = {}
	covered_types = []
	covered_inst = []

	def __init__(self, in_data):
		super().__init__()

	def add_type(self, in_data):
		for i in in_data["modules"]:
			self.modules[i["module"]] = v_module(i)
		self.covered_types.append(in_data["instruction type"])

	def add_inst(self, in_data):
		for i in in_data["delta"]:
			self.modules[i["module"]].add_code(i["delta"])
		self.covered_inst.append(in_data["instruction"])
