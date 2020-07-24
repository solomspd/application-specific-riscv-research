class v_code:

	def __init__(self, in_data, index):
		self.type = in_data["type"]
		if self.type == "always":
			self.trigger = in_data["trigger"]
			self.code = code(in_data["code"])
		elif self.type == "case":
			self.selector = in_data["selector"]
			self.before = in_data["before"]
			self.code = in_data["code"]
		elif self.type == "loose":
			self.tag = in_data["tag"]
			if self.tag is not None: index[self.tag] = self
			
			self.code.append(in_data["code"])
		else:
			print("code read error")
