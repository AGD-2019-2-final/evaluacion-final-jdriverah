#! /usr/bin/env python
import sys
if __name__ == '__main__':
    for line in sys.stdin:
        line = line.replace('\n','')
        valor, clave=line.split("\t")
        clave2=clave.split(",")
        for i in clave2:
            sys.stdout.write(i+"\t"+str(valor)+"\n")
    
        
