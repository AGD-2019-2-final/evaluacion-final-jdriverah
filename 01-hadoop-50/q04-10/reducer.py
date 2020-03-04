import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    Clave_act = None
    total = 0

    for line in sys.stdin:

        clave, valor = line.split(",")
        valor = int(valor)

        if clave == Clave_act:
        
            total += valor
        else:
         
            if Clave_act is not None:
           
                sys.stdout.write("{},{}\n".format(Clave_act, total))

            Clave_act = clave
            total = valor

    sys.stdout.write("{},{}\n".format(Clave_act, total))
