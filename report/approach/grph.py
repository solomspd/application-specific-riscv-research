from graphviz import Digraph

dot = Digraph('plz work')

dot.node('pc', 'PC')
dot.node('reg', 'Register File')

dot.edge('pc','reg')

dot.render('output/graph.gv', view=True)