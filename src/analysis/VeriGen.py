# -*- coding: utf-8 -*-
"""
Created on Tue Aug 11 01:37:49 2020

@author: Haitham S. Fawzi
"""

import json


alwaysflag=0
caseflag=0

with open('E:/Solom Branch/application-specific-riscv-research-solom/src/data/arithmatic.json') as lookup_file:
    lookup_file=json.load(lookup_file)  

   #Iterating over available modules defined inside JSON
for i in range(len(lookup_file['modules'])):  
   f = open("generatedCode"+str(i)+".txt", "w") 
   f.write("module %s (" %(lookup_file['modules'][i]['module']))
   print("module %s (" %(lookup_file['modules'][i]['module']), end='')
   #Inputs Extraction loop
   for j in range(len(lookup_file['modules'][i]['input'])):
       if(lookup_file['modules'][i]['input'][j]['length']==1):
           f.write("input %s, " %(lookup_file['modules'][i]['input'][j]['name']))
           print("input %s, " %(lookup_file['modules'][i]['input'][j]['name']),end='')
       else:
           f.write("input [%d:0] %s, " %((lookup_file['modules'][i]['input'][j]['length']-1), lookup_file['modules'][i]['input'][j]['name']))
           print("input [%d:0] %s, " %((lookup_file['modules'][i]['input'][j]['length']-1), lookup_file['modules'][i]['input'][j]['name']),end='')     
  #Outputs Extraction loop
   for k in range(len(lookup_file['modules'][i]['output'])):
       if(lookup_file['modules'][i]['output'][k]['length']==1):
             if(k==(len(lookup_file['modules'][i]['output'])-1)):
                 f.write("output %s" %(lookup_file['modules'][i]['output'][k]['name']))
                 print("output %s" %(lookup_file['modules'][i]['output'][k]['name']),end='')
             else:    
                 f.write("output %s, " %(lookup_file['modules'][i]['output'][k]['name']))
                 print("output %s, " %(lookup_file['modules'][i]['output'][k]['name']),end='')
       else:
            if(k==(len(lookup_file['modules'][i]['output'])-1)):
                f.write("output [%d:0] %s" %((lookup_file['modules'][i]['output'][k]['length']-1), lookup_file['modules'][i]['output'][k]['name']))
                print("output [%d:0] %s" %((lookup_file['modules'][i]['output'][k]['length']-1), lookup_file['modules'][i]['output'][k]['name']),end='')     
            else:     
                f.write("output [%d:0] %s, " %((lookup_file['modules'][i]['output'][k]['length']-1), lookup_file['modules'][i]['output'][k]['name']))
                print("output [%d:0] %s, " %((lookup_file['modules'][i]['output'][k]['length']-1), lookup_file['modules'][i]['output'][k]['name']),end='')     
   f.write(')')
   f.write('\n')         
   print(')')  
   #Looping over available scopes in each module
   for m in range(len(lookup_file['modules'][i]['code'])):
        s=lookup_file['modules'][i]['code'][m]
        while(s['type'] != 'loose'):       #digging inside each scope until reaching the "loose" code
            if(s['type'] == 'always'):
                alwaysflag=1
                f.write("always @(%s) begin" %(s['trigger']))    #constructing "always" scope structure
                f.write('\n')
                print("always @(%s) begin" %(s['trigger']))
            elif(s['type'] == 'case'):                             #constructing "case" scope structure
                caseflag=1
                f.write("case (%s) " %(s['selector']))
                print("case (%s) " %(s['selector']))
            s=s['code'][0]            #digging one level deeper
        f.write('\n')    
        f.write(s['code'])    
        print(s['code'])   
        if(caseflag):
            f.write('\nendcase\n')
            caseflag=0
        if(alwaysflag):
            f.write('\nend\n')  
            alwaysflag=0
    
    
    
   
   f.write('\n endmodule')
   print('\n endmodule')    
   
   f.close()
