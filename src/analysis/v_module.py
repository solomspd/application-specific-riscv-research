import analysis.v_code
class v_module:

	code = []
	tag_idx = {}
	
	def __init__(self, in_data):
		self.module = in_data["module"]
		self.inputs = in_data["input"]
		self.outputs = in_data["output"]
		for i in in_data["code"]:
			self.code.append(v_code(in_data["code"]))
		self.tag_idx = self.code.index()

	def add_code(self, delta):
		for i in delta:
			tag_idx[i["tag"]].code.append(i["code"])