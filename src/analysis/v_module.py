
class v_module:

	def __init__(self, in_data=None):
		if in_data is not None:
			self.tag_idx = {}
			self.module = in_data["module"]
			self.inputs = in_data["input"]
			self.outputs = in_data["output"]
			self.code = in_data["code"]
			self.index(in_data["code"])

	def add_code(self, delta):
		for i in delta:
			self.tag_idx[i["tag"]].append(i["code"])

	def merge_mod(self, in_module):
		for i in in_module.inputs:
			exist = False
			for j in self.inputs:
				if i["name"] == j["name"]:
					exist = True
					for k in i["from"]:
						if k not in j["from"]:
							j["from"].append(k)
					break
			if not exist:
				self.inputs.append(i)
		for i in in_module.outputs:
			if i not in self.outputs:
				self.outputs.append(i)
		self.merge_code(self.code, in_module.code)

	def index(self, in_code):
		for i in in_code:
			if i["type"] == "loose":
				if "tag" in i:
					if "code" not in i:
						i["code"] = []
					self.tag_idx[i["tag"]] = i["code"]
			else:
				self.index(i["code"])

	def merge_code(self, self_code, other):
		for j in other:
			exist = False
			for i in self_code:
				if self.get_sig(i) == self.get_sig(j):
					exist = True
					if i["type"] == "loose":
						for k in j["code"]:
							if k not in i["code"]:
								i["code"].append(k)
					else:
						self.merge_code(i["code"], j["code"])
					break
			if not exist:
				self_code.append(j)

	def to_json(self):
		return {
			"module": self.module,
			"input": self.inputs,
			"output": self.outputs,
			"code": self.code
		}

	# Boiler plate function for checking if the immediate level of the recusive code structure is uinique. A means of checking the "signature" in a sense
	def get_sig(self, in_code):
		# THERE MUST BE A BETTER WAY OF GOING ABOUT THIS, THIS IS DUMB
		ret_type = in_code["type"]

		try:
			ret_sel = in_code["selector"]
		except:
			ret_sel = None

		try:
			ret_bef = in_code["before"]
		except:
			ret_bef = None

		try:
			ret_trig = in_code["trigger"]
		except:
			ret_trig = None

		return (ret_type, ret_sel, ret_bef, ret_trig)
