#!/usr/bin/lua5.3

require "arrayUtils"

-- inicializar la semilla aleatoria
math.randomseed( os.time() )

local x = generaArreglo(5)
imprimirArreglo(x)