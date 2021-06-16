org 100h

    section .text
    xor AX, AX
    xor SI, SI
    xor BX, BX
    XOR CX, CX
    xor DX, DX

    MOV SI, 0
    MOV DI, 0d

    MOV DH, 10
    MOV DL, 20

    call modotexto

    ITERAR:
        call movercursor
        MOV CL, [cadena+SI]
        call escribircaracter
        cmp DI, 4d
        je saltarFilas
        cmp DI, 12d
        je saltarFilas
        cmp DI, 21d
        je saltarFilas
    ReturnIterar:
        INC SI
        INC DL
        INC DI
        CMP DI, 30d
        JB ITERAR
        jmp esperartecla

    modotexto: 
        MOV AH, 0h
        MOV AL, 03h 
        INT 10h
        RET
    movercursor:
        MOV AH, 02h
        MOV BH, 0h 
        INT 10h
        RET
    escribircaracter:
        MOV AH, 0Ah
        MOV AL, CL
        MOV BH, 0h
        MOV CX, 1h
        INT 10h
        RET

    esperartecla:
        MOV AH, 00h
        INT 16h

    saltarFilas: 
        inc DH
        inc DH
        MOV DL, 19d
        jmp ReturnIterar

    exit:
        int 20h


    section .dataS

    cadena DT 'Saul Ernesto Orellana Jimenez'
    