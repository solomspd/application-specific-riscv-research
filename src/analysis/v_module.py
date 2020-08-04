import analysis.v_code
class v_module:

	tag_idx = {}
	
	def __init__(self, in_data):
		self.module = in_data["module"]
		self.inputs = in_data["input"]
		self.outputs = in_data["output"]
		self.code = v_code(in_data["code"])
		self.tag_idx = self.code.index()

	def add_code(self, delta):
		for i in delta:
			tag_idx[i["tag"]].code.append(i["code"])
        
        def merge(self, in_module):
            self.inputs.append(diff(self.inputs,in_module.inputs))
            self.outputs.append(diff(self.inputs,in_module.inputs))
            self.code.merge(in_module.code)
