# -*- coding: utf-8 -*-
"""
Created on Tue Aug 11 01:37:49 2020

@author: Haitham S. Fawzi
"""

import ModLib as mdl

foldername=input('pleaser enter folder name: ')
filename=input('please enter the target file name (json only): ')

lookup_file=mdl.locateFile(foldername,filename)

mdl.generateModules(lookup_file)   