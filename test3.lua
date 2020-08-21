#!/usr/bin/lua5.3
function Pares(Number)
    local arreglo = {}
    for i = 1, Number, 1
    do
        i = i * 2
        table.insert(arreglo, i)
    end
    return arreglo
end

function imprimirArreglo(arreglo)
    for k, valor in ipairs(arreglo)
    do
       print(valor)
    end
end

function sumarreglo(arreglo)
    local guardanums = 0
    for k, Numero in ipairs(arreglo)
    do
        guardanums = guardanums + Numero
    end
    return guardanums
end

local a = {1,2,3} -- costo 1


--local pares = Pares(10000000) --costo n 
--imprimirArreglo(pares) --costo n

--print("resultado", sumarreglo(pares)) --costo n
local cantidad = 10000000
print("resultado", (cantidad*2 + 2) * cantidad) --costo n



