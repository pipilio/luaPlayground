#!/usr/bin/lua5.3

function creaNodo(numero) 
    print("creando nodo")
    local nuevoNodo = {
        num = numero,
        izq = nil,
        der = nil
    }
    return nuevoNodo;
end

function imprimeNodo(nodo, depth)
    if nodo ~= nil
    then
        local left = nodo.izq
        local right = nodo.der
        if left ~= nil
        then
            imprimeNodo(left, depth+1)
        end
        print(string.rep("--", depth)..nodo.num)
        if right ~= nil
        then
            imprimeNodo(right, depth+1)
        end
    else
        print("NIL")
    end
end

function insertaElemento(nodo, numero)
    print ("inserting", numero, "in", nodo)
    local ret = nodo
    if nodo == nil
    then
        ret = creaNodo(numero)
    else
        print("found", nodo.num)
        if numero >= nodo.num
        then
            print("going right")
            nodo.der = insertaElemento(nodo.der, numero)
        else
            print("going left")
            nodo.izq = insertaElemento(nodo.izq, numero)
        end
    end
    return ret
end


function cargarArbolBinario(arbol, arreglo)
    local tree = arbol
    for k, v in ipairs(arreglo)
    do
        tree = insertaElemento(tree, v)
    end
    return tree
end

function encontrarNumero(arbol, numero)
    -- retorna true si el numero esta en el arbol
    -- retorna false si el numero no esta en el arbol
end

local arbol = nil



--arbol = insertaElemento(arbol, 5)
--arbol = insertaElemento(arbol, 1)
--arbol = insertaElemento(arbol, 11)
--arbol = insertaElemento(arbol, 4)
--arbol = insertaElemento(arbol, 11)
--arbol = insertaElemento(arbol, 0)
--arbol = insertaElemento(arbol, 9)
--arbol = insertaElemento(arbol, 20)
--arbol = insertaElemento(arbol, 21)

imprimeNodo(arbol, 1)
local x = cargarArbolBinario(arbol, {1,5,3})
print(x)

-- print("arbol", arbol)