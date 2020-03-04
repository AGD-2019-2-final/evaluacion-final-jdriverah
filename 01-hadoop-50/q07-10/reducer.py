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
        
        if Clave == Clave_act:
            misma_letra.append([int(valor.replace('\n','')),Clave,fecha])

        else:
            if Clave_act is not None:
                misma_letra.sort()
                for i in misma_letra:
                    sys.stdout.write(i[1]+'   '+i[2]+'   '+str(i[0])+'\n')
                misma_letra = []
            
            Clave_act = Clave
            misma_letra.append([int(valor.replace('\n','')),Clave,fecha])
    misma_letra.sort()
    for i in misma_letra:
        sys.stdout.write(i[1]+'   '+i[2]+'   '+str(i[0])+'\n')
