#!/usr/bin/env python
import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    Clave_act = None
    misma_letra = []

    for line in sys.stdin:
        
        Clave,fecha,valor = line.split(',')
        
        misma_letra.append([int(valor.replace('\n','')),Clave,fecha])

    misma_letra.sort()

    for i in range(6):
        sys.stdout.write(misma_letra[i][1]+'   '+misma_letra[i][2]+'   '+str(misma_letra[i][0])+'\n')
