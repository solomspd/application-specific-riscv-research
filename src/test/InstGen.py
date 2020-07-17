# -*- coding: utf-8 -*-
"""
Created on Wed Jun 10 16:33:00 2020

@author: Haitham S. Fawzi
"""
MyFile = open("E:/CA_research/src/test/hexa.txt","r");
lines = MyFile.readlines();
temp = [None] * 38;
instList = [None] * 38;
mem = [];
for i in range(len(lines)):
    temp=lines[i].split(' ');   
    if(temp[0] !='' and temp[0] != '\n'):
        instList[i]=temp[2];
    else:
        instList[i]=-1;
for i in range(2,(len(instList)-1)):
    mem.append(instList[i][2:4]);
    mem.append(instList[i][4:6]);
    mem.append(instList[i][6:8]);
    mem.append(instList[i][8:10]);

MyFile.close();
MyFile = open("E:/CA_research/src/test/memFill.txt","w");
for i in range(len(mem)):
    MyFile.write("mem[%d] = 8'h%s; \n" %(i, mem[i])); 
MyFile.close();

  
    
    
    
    
    
        
        
    
        
    
