#!/usr/bin/lua5.3
palabras = {"Velocidad", "caminar", "Caminar", "heal", "recibir daño", "caminar", "recibir daño", "velocidad", "caminar", "recibir daño"}
local resultados = { }

for num, palabra in ipairs(palabras)
do
    local inicial = string.lower(string.sub(palabra,1,1))
    local cantidad = resultados[inicial]
    if ( cantidad ~= nil )
    then
        print("si")
        resultados[inicial] = resultados[inicial] + 1
    else
        print("no")
        resultados[inicial] = 1
    end
end


for inicial, cantidad in pairs(resultados)
do
    print(string.format("%s esta repetido %d veces", inicial, cantidad))
end