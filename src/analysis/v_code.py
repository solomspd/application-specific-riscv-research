class v_code:

        code = []

	def __init__(self, in_data, index):
	    for i in in_data:
	        tmp_code = v_code()
	        tmp_code.type = in_data["type"]
		# self.type = in_data["type"]
		if self.type == "always":
			# self.trigger = in_data["trigger"]
			# self.codecode(in_data["code"])
			tmp_code.trigger = in_data["trigger"]
			tmp_code.append(v_code(in_data["code"]))
		elif self.type == "case":
			#self.selector = in_data["selector"]
			# self.before = in_data["before"]
			# self.code = in_data["code"]
			tmp_code.selector = in_data["selector"]
			tmp_code.before = in_data["before"] 
			tmp_code.code.append(v_code(in_data["code"]))
		elif self.type == "loose":
			# self.tag = in_data["tag"]
			# if self.tag is not None: index[self.tag] = self
			# self.code.append(in_data["code"])
			tmp_code.code.append(in_data["code"])
			
		else:
			print("code read error")

		self.code.append(tmp_code)
	
	def merge(self,in_code):
            for i in self.code # i know this is wrong just needs a set for it to work. expect that soon
                if eq_sig(i,j):
                    i.merge(j)
            

        # Boiler plate function for checking if the immediate level of the recusive code structure is uinique. A means of checking the "signature" in a sense
        def get_sig(self):
            return [self.type,self.selector,self.before,self.trigger]

        # check if 2 code sturctures have equal signatures
        def eq_sig(self,other):
            return get_sig(self).sort() == get_sig(other).sort()

