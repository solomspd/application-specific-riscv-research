class v_code:

	def __init__(self, in_data, tag):
		self.code = []
		for i in in_data:
			if i["type"] == "loose":
				if "tag" in i:
					tag[i["tag"]] = self.code
				else:
					self.code.append(i)
			else:
				if i["type"] == "always":
					tmp_code = v_code(i["code"],tag)
					tmp_code.trigger = i["trigger"]
				elif i["type"] == "case":
					tmp_code = v_code(i["code"],tag)
					tmp_code.selector = i["selector"]
					if "before" in i:
						tmp_code.before = i["before"] 
				self.code.append(tmp_code)
	
	def merge(self,in_code):
		for i in self.code: # this bit should be simple but the logic became confisuing, there should be a more elegeant way of going about this
			for j in in_code.code:
				if i == j:
					if i.type == "loose":
						i.code.append(in_code.code)
					else:
						i.code.merge(j)


	# Boiler plate function for checking if the immediate level of the recusive code structure is uinique. A means of checking the "signature" in a sense
	def get_sig(self):
		return [self.type,self.selector,self.before,self.trigger]

	# check if 2 code sturctures have equal signatures
	def __eq__(self,other):
		return get_sig(self).sort() == get_sig(other).sort()