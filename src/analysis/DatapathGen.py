# -*- coding: utf-8 -*-
"""
Created on Tue Aug 18 01:56:38 2020

@author: Haitham S. Fawzi
"""
import json
import DPlib as dpl
        

with open('E:/Solom Branch/application-specific-riscv-research-solom/src/data/arithmatic.json') as lookup_file:
    lookup_file=json.load(lookup_file)  

f = open("Datapath.txt", "w") 
dpl.printDatapathHeader(f);
dpl.generateInternalWires(f,lookup_file);
dpl.InstantiateModules(f,lookup_file);
dpl.printDatapathTerminator(f);
f.close()

 