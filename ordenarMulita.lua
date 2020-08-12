#!/usr/bin/lua5.3

function encuentraMenor(arreglo)
    local menor, posMenor = arreglo[1], 1
    for k, v in ipairs(arreglo)
    do
        if v < menor
        then
            menor, posMenor = v, k
        end
    end
    return menor, posMenor
end

function imprimirArreglo(arreglo)
    for k, valor in ipairs(arreglo)
    do
       print(k, valor)
    end
end

function ordenaArreglo(arreglo)
    local salida = {}
    local length = #arreglo
    for k = 1, length, 1
    do
        imprimirArreglo(arreglo)
        print("---")
        local menor, posMenor = encuentraMenor(arreglo)
        print("el menor es ", menor, posMenor)
        table.insert(salida, menor)
        table.remove(arreglo, posMenor)
    end
    return salida
end


local arr = { 5, 6, 0, 0, 9, 1 }
--imprimirArreglo(arr)
imprimirArreglo(ordenaArreglo(arr))


 