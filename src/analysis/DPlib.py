# -*- coding: utf-8 -*-
"""
Created on Mon Aug 24 04:13:43 2020

@author: Haitham S. Fawzi
"""


def listToString(s):
	str1 = ""
	return (str1.join(s))


def printDatapathHeader(f):
	f.write("module datapath (input clk, input rst);\n")
	print("module datapath (input clk, input rst);")


def printDatapathTerminator(f):
	f.write('endmodule')
	print('endmodule')


def addControl(f, lookup_file, ctrl_layout, i, j):
	for z in range(len(ctrl_layout)):
		if ctrl_layout[z]['module'] == lookup_file['modules'][i]['module']:
			TargetModule = z
	print('.%s(' % (lookup_file['modules'][i]['input'][j]["name"]), end='')
	f.write('.%s(' % (lookup_file['modules'][i]['input'][j]["name"]))
	for c in range(len(ctrl_layout[TargetModule]['mux'])):
		print('%s? %s: ' % (ctrl_layout[TargetModule]['mux'][c]['selector'],ctrl_layout[TargetModule]['mux'][c]['order']), end='')
		f.write('%s? %s: ' % (ctrl_layout[TargetModule]['mux'][c]['selector'], ctrl_layout[TargetModule]['mux'][c]['order']))
	print('%s)' % (ctrl_layout[TargetModule]['default']), end='')
	f.write('%s)' % (ctrl_layout[TargetModule]['default']))


def generateInternalWires(f, lookup_file):
	for i in range(len(lookup_file['modules'])):
		for j in range(len(lookup_file['modules'][i]['output'])):
			if(lookup_file['modules'][i]['output'][j]['length'] == 1):
				f.write("wire %s;" %
						(lookup_file['modules'][i]['output'][j]['name']))
				f.write('\n')
				print("wire %s;" %
					  (lookup_file['modules'][i]['output'][j]['name']))
			else:
				f.write("wire [%d:0] %s;" % ((lookup_file['modules'][i]['output']
											  [j]['length']-1), lookup_file['modules'][i]['output'][j]['name']))
				f.write('\n')
				print("wire [%d:0] %s;" % ((lookup_file['modules'][i]['output'][j]
											['length']-1), lookup_file['modules'][i]['output'][j]['name']))


def InstantiateModules(f, lookup_file):
	for i in range(len(lookup_file['modules'])):  # iterating over all modules

		f.write("%s  %s%d (" % (
			lookup_file['modules'][i]['module'], lookup_file['modules'][i]['module'], i))
		print("%s  %s%d (" % (
			lookup_file['modules'][i]['module'], lookup_file['modules'][i]['module'], i), end='')

		# connecting inputs
		for j in range(len(lookup_file['modules'][i]['input'])):
			try:
				x = lookup_file['modules'][i]['input'][j]["from"][0]["modifier"]
				replace_index = x.find('%')
				x = list(x)
				x[replace_index] = lookup_file['modules'][i]['input'][j]["from"][0]["port"]
				x = listToString(x)
				print(" .%s(%s), " %
					  (lookup_file['modules'][i]['input'][j]["name"], x), end='')
				f.write(" .%s(%s), " %
						(lookup_file['modules'][i]['input'][j]["name"], x))
			except:

				print(" .%s(%s), " % (lookup_file['modules'][i]['input'][j]["name"],
									  lookup_file['modules'][i]['input'][j]["from"][0]["port"]), end='')
				f.write(" .%s(%s), " % (
					lookup_file['modules'][i]['input'][j]["name"], lookup_file['modules'][i]['input'][j]["from"][0]["port"]))
		# conneting outputs
		for k in range(len(lookup_file['modules'][i]['output'])):
			if(k == (len(lookup_file['modules'][i]['output'])-1)):
				print(" .%s(%s)" % (lookup_file['modules'][i]['output'][k]["name"],
									lookup_file['modules'][i]['output'][k]["name"]), end='')
				f.write(" .%s(%s)" % (
					lookup_file['modules'][i]['output'][k]["name"], lookup_file['modules'][i]['output'][k]["name"]))

		print(');\n')
		f.write(');\n')


def InstantiateModulesControl(f, lookup_file, ctrl_layout):

	for i in range(len(lookup_file['modules'])):  # iterating over all modules

		f.write("%s  %s%d (" % (
			lookup_file['modules'][i]['module'], lookup_file['modules'][i]['module'], i))
		print("%s  %s%d (" % (
			lookup_file['modules'][i]['module'], lookup_file['modules'][i]['module'], i), end='')

		# connecting inputs
		for j in range(len(lookup_file['modules'][i]['input'])):
			if(len(lookup_file['modules'][i]['input'][j]['from']) == 1):

				try:
					x = lookup_file['modules'][i]['input'][j]["from"][0]["modifier"]
					replace_index = x.find('%')
					x = list(x)
					x[replace_index] = lookup_file['modules'][i]['input'][j]["from"][0]["port"]
					x = listToString(x)
					print(" .%s(%s), " % (
						lookup_file['modules'][i]['input'][j]["name"], x), end='')
					f.write(" .%s(%s), " %
							(lookup_file['modules'][i]['input'][j]["name"], x))
				except:

					print(" .%s(%s), " % (lookup_file['modules'][i]['input'][j]["name"],
										  lookup_file['modules'][i]['input'][j]["from"][0]["port"]), end='')
					f.write(" .%s(%s), " % (
						lookup_file['modules'][i]['input'][j]["name"], lookup_file['modules'][i]['input'][j]["from"][0]["port"]))

			else:
				addControl(f, lookup_file, ctrl_layout, i, j)

		# conneting outputs
		for k in range(len(lookup_file['modules'][i]['output'])):
			if(k == (len(lookup_file['modules'][i]['output'])-1)):
				print(" .%s(%s)" % (lookup_file['modules'][i]['output'][k]["name"],
									lookup_file['modules'][i]['output'][k]["name"]), end='')
				f.write(" .%s(%s)" % (
					lookup_file['modules'][i]['output'][k]["name"], lookup_file['modules'][i]['output'][k]["name"]))

		print(');\n')
		f.write(');\n')


def generateDatapath(lookup_file, ctrl_layout):
	f = open("Datapath.txt", "w")
	printDatapathHeader(f)
	generateInternalWires(f, lookup_file)
	InstantiateModulesControl(f, lookup_file, ctrl_layout)
	printDatapathTerminator(f)
	f.close()
