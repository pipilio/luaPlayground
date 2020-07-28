#!/usr/bin/lua5.3
local acciones = {"velocidad", "saltar", "recibir daño", "heal", "recibir daño", "recibir daño", "recibir daño", "caminar", "recibir daño", "velocidad", "recibir daño"}
local hp = 3
local posicion = 0

function efectuarAccions(hp, posicion, accion)
    local newhp, newposicion = hp, posicion
    if (accion == "caminar")
    then
        newposicion = newposicion + 1
        print("has caminao, tu posición es", newposicion)
    elseif (accion == "saltar")
    then
        print("saltaste, no sirve de nada")
    elseif (accion == "recibir daño")
    then
        newhp = newhp - 1
        print("te han pegao, tu hp quedó en", newhp)
    elseif (accion == "heal")
    then
        newhp = newhp + 1
        print("te han curao, tu hp quedó en", newhp)
    elseif (accion == "velocidad")
    then
        newposicion = newposicion + 2
        print("HASTE", newposicion)
    else
        print("acción desconocida, no hice nada")
    end
    return newhp, newposicion
end

for key, currentAccion in ipairs(acciones)
do
    print("antes", hp, posicion)
    hp, posicion = efectuarAccions(hp, posicion, currentAccion)
    if (hp <= 0)
    then
        print("tukeaste")
        break
    end
end

if (hp > 0)
then
    print ("tu posicion es ", posicion, "y tu hp es", hp)
    print("eres buff doge")
else
    print ("tu posicion es ", posicion, "y tu hp es", hp)
    print("eres cheems")
end

--tarea: implementar haste. implementar criterio de ganar cuando está vivo y posicion es al menos 10