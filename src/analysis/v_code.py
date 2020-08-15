class v_code:

	def __init__(self, in_data, tag):
		self.code = []
		for i in in_data:
			
			if i["type"] == "loose":
				if "tag" in i:
					tag[i["tag"]] = self.code
				else:
					self.type = "loose"
					self.code.append(i)
			else:
				tmp_code = v_code(i["code"],tag)
				tmp_code.type = i["type"]
				if i["type"] == "always":
					tmp_code.trigger = i["trigger"]
				elif i["type"] == "case":
					tmp_code.selector = i["selector"]
					if "before" in i:
						tmp_code.before = i["before"] 
				self.code.append(tmp_code)
	
	def merge(self,in_code):
		for i in self.code: # this bit should be simple but the logic became confisuing, there should be a more elegeant way of going about this
			for j in in_code.code:
				if type(i) is dict or i == j:
					if type(i) is dict and i["type"] == "loose":
						if j["code"] not in i["code"]:
							i.append(j["code"])
					else:
						i.merge(j)
		for i in in_code.code:
			if i not in self.code:
				self.code.append(i)
			# exist = False
			# for j in self.code:
			# 	if j == i:
			# 		exist = True
			# 		break
			# if not exist:
			# 	self.code.append(i)




	# Boiler plate function for checking if the immediate level of the recusive code structure is uinique. A means of checking the "signature" in a sense
	def get_sig(self):
		# THERE MUST BE A BETTER WAY OF GOING ABOUT THIS, THIS IS DUMB
		ret_type = self.type

		try:
			ret_sel = self.selector
		except:
			ret_sel = None

		try:
			ret_bef = self.before
		except:
			ret_bef = None

		try:
			ret_trig = self.trigger
		except:
			ret_trig = None

		return (ret_type,ret_sel,ret_bef,ret_trig)

	# check if 2 code sturctures have equal signatures
	def __eq__(self,other):
		return self.get_sig() == other.get_sig()

	def __hash__(self):
		return hash(self.get_sig())