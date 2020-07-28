#!/usr/bin/lua5.3
local acciones = {"velocidad", "saltar", "recibir daño", "heal", "recibir daño", "caminar", "recibir daño", "velocidad", "recibir daño"}
local health = 3
local x = 0
local v = false

function efectuarAccions(hp, posicion, velocidad, accion)
    local newhp, newposicion, newVelocidad = hp, posicion, velocidad
    if (accion == "caminar")
    then
        if (velocidad == true)
        then
            print("caminaste rápido")
            newposicion = newposicion + 2
        else
            newposicion = newposicion + 1
        end
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
        newVelocidad = true
        print("HASTE")
    else
        print("acción desconocida, no hice nada")
    end
    return newhp, newposicion, newVelocidad
end

for key, currentAccion in ipairs(acciones)
do
    print("antes", health, x)
    health, x, v = efectuarAccions(health, x, v, currentAccion)
    if (health <= 0)
    then
        print("tukeaste")
        break
    end
end

if (health > 0)
then
    print ("tu posicion es ", x, "y tu hp es", health)
    print("eres buff doge")
else
    print ("tu posicion es ", x, "y tu hp es", health)
    print("eres cheems")
end

--tarea: implementar haste. implementar criterio de ganar cuando está vivo y posicion es al menos 10