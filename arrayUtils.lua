function generaArreglo(largo)
    local arreglo = {}
    for i = 1,largo,1
    do
        local indice = math.random(1,1000000)
        table.insert(arreglo, indice)
    end
    return arreglo
end

function imprimirArreglo(arreglo)
    for k, valor in ipairs(arreglo)
    do
       print(k, valor)
    end
end