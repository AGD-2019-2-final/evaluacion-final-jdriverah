#!/usr/bin/env python
import sys
#
#  >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    Clave_act = None
    listasum=[]

    for line in sys.stdin:

        clave, valor = line.split("\t")
        valor = float(valor)

        if clave == Clave_act:
            listasum.append(float(valor))
        else:
            if Clave_act is not None:
                suma=sum(listasum)
                elementos=len(listasum)
                
                sys.stdout.write(Clave_act.replace("\n","")+"       "+str(suma)+" "+str(suma/elementos)+"\n")
            Clave_act = clave    
            listasum=[]
            listasum.append(float(valor))
    suma=sum(listasum)
    elementos=len(listasum)
    sys.stdout.write(Clave_act.replace("\n","")+"       "+str(suma)+" "+str(round(suma/elementos,3))+"...\n")
