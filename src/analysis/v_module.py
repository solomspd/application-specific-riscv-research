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
		for i in in_module.inputs:
			if i not in self.inputs:
				self.inputs.append(i)
		for i in in_module.outputs:
			if i not in self.outputs:
				self.outputs.append(i)
		self.code.merge(in_module.code)