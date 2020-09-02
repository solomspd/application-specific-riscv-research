# -*- coding: utf-8 -*-
"""
Created on Tue Aug 18 01:56:38 2020

@author: Haitham S. Fawzi
"""
import json
import DPlib as dpl
import os
import ModLib as mdl
        

path = os.path.abspath(os.path.join(os.path.dirname(__file__), os.pardir))
with open(os.path.join(path, "data", "mux.json"), "rt") as ctrl_layout:
    ctrl_layout=json.load(ctrl_layout)

lookup_file=mdl.locateFile("/data/Abdo/Abdo/Abdos University work/spring 2020/Research", "message")
lookup_file = json.load(open("/data/Abdo/Abdo/Abdos University work/spring 2020/Research/message.json"))

dpl.generateDatapath(lookup_file,ctrl_layout)