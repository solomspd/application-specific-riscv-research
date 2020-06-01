from graphviz import Digraph

dot = Digraph('plz work')

dot.node('pc', 'PC')
dot.node('reg', 'Register File')
dot.node('alu','ALU')
dot.node('dm','Data Memory')
dot.node('br','Branch')
dot.node('imm','Imm Gen')
dot.node('ctrl','Control')
dot.node('im','Instruction Memory')

dot.edge('reg','alu')
dot.edge('alu','dm')
dot.edge('reg','br')
dot.edge('dm','reg')
dot.edge('alu','br')
dot.edge('imm','pc')
dot.edge('ctrl','br')
dot.edge('ctrl','alu')
dot.edge('ctrl','dm')
dot.edge('ctrl','reg')
dot.edge('im','reg')
dot.edge('im','ctrl')
dot.edge('pc','im')
dot.edge('im','imm')
dot.edge('imm','alu')
dot.edge('br','pc')


dot.render('./graph.gv', view=True)