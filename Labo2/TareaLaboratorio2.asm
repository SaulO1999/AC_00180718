        org     100h

        section .text

        mov byte [200h], "S"
        mov byte [201h], "E"
        mov byte [202h], "O"
        mov byte [203h], "J"

;Direccionamiento directo

        mov AX, [200h]

;Direccionamiento indirecto por registo

        mov BX, [201h]
        mov CX, [BX]

;Direccionamiento base mas indice

        mov BX, [202h]
        mov DX, [BX+DI]

;Direccinamiento relativo por registro

        mov DI, [DI+203h]

        

