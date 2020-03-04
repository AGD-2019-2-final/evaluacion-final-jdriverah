import sys
#
#  >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    Clave_act = None
    Current_value = 0
    Minimun_value = 0

    for line in sys.stdin:

        clave, valor = line.split("\t")
        valor = float(valor)

        if clave == Clave_act:
            if Current_value > valor:
                Current_value = Current_value
            else:
                Current_value = valor
                
            if Minimun_value < valor:
                Minimun_value = Minimun_value
            else:
                Minimun_value = valor
        else:
         
            if Clave_act is not None:
           
                sys.stdout.write("{}\t{}\t{}\n".format(Clave_act, Current_value, Minimun_value))

            Clave_act = clave
            Current_value = valor
            Minimun_value = valor

    sys.stdout.write("{}\t{}\t{}\n".format(Clave_act, Current_value, Minimun_value))
