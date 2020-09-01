# -*- coding: utf-8 -*-
"""
Created on Tue Aug 18 01:56:38 2020

@author: Haitham S. Fawzi
"""
import json
import DPlib as dpl
import os
        

path = os.path.abspath(os.path.join(os.path.dirname(__file__), os.pardir))
with open(os.path.join(path, "data", "test.json"), "rt") as lookup_file:
       lookup_file=json.load(lookup_file) 
with open(os.path.join(path, "data", "mux.json"), "rt") as ctrl_layout:
        ctrl_layout=json.load(ctrl_layout)        
    
    
f = open("Datapath.txt", "w") 

dpl.printDatapathHeader(f);
dpl.generateInternalWires(f,lookup_file);
dpl.InstantiateModulesControl(f,lookup_file,ctrl_layout);
dpl.printDatapathTerminator(f);
f.close()

 