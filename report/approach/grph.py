from graphviz import Digraph

dot = Digraph('plz work')

dot.node('pc', 'PC')
dot.node('reg', 'Register File')
dot.node('alu','ALU')
# dot.node('dm','Data Memory')
# dot.node('br','Branch')
# dot.node('imm','Imm Gen')
dot.node('ctrl','Control')
dot.node('im','Instruction Memory')

dot.edge('reg','alu','src1')
dot.edge('reg','alu','src2')
# dot.edge('alu','dm','src2')
# dot.edge('reg','br','scr1')
# dot.edge('reg','br','src2')
# dot.edge('dm','reg')
# dot.edge('alu','br')
# dot.edge('imm','pc')
# dot.edge('ctrl','br')
dot.edge('alu','reg','dest')
dot.edge('ctrl','alu','alufn')
# dot.edge('ctrl','dm')
dot.edge('ctrl','reg','reg_write')
dot.edge('im','reg','rs1')
dot.edge('im','reg','rs2')
dot.edge('im','reg','rd')
dot.edge('im','ctrl','op')
dot.edge('pc','im')
dot.edge('pc','pc','PC+4')
# dot.edge('im','imm')
# dot.edge('imm','alu')
# dot.edge('br','pc')


dot.render('./report/approach/graph.dot', view=True)