from v_code import v_code

class v_module:

	def __init__(self, in_data=None):
		if in_data is not None:
			self.tag_idx = {}
			self.module = in_data["module"]
			self.inputs = in_data["input"]
			self.outputs = in_data["output"]
			self.code = v_code(in_data["code"],self.tag_idx)

	def add_code(self, delta):
		for i in delta:
			self.tag_idx[i["tag"]].append({"code":i["code"],"type":"loose"})

	def merge(self, in_module):
		self.inputs.append(diff(self.inputs,in_module.inputs))
		self.outputs.append(diff(self.outputs,in_module.outputs))
		for i in self.code:
			for j in in_module.code:
				if i == j:
					i.code.append(j.code)
				else:
					i.merge(j)