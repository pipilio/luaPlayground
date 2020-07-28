#!/usr/bin/lua5.3
local acciones = {"velocidad", "caminar", "caminar", "heal", "recibir daño", "caminar", "recibir daño", "velocidad", "caminar", "recibir daño"}
local health = 5
local x = 0
local v = 1
local turnoActivacionHaste = 0

function efectuarAccions(hp, posicion, velocidad, turno, tah, accion)
    local newhp, newposicion, newVelocidad, newtah = hp, posicion, velocidad, newTurnoActivacionHaste
    if (accion == "caminar")
    then
        newposicion = newposicion + velocidad
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
        newVelocidad = velocidad * 2
        newTurnoActivacionHaste = turno
        print("HASTE")
    else
        print("acción desconocida, no hice nada")
    end
    if (newTurnoActivacionHaste ~= 0 and turno - newTurnoActivacionHaste >= 2)
    then
        print("te quito el haste")
        newVelocidad = 1
        newTurnoActivacionHaste = 0
    end
    return newhp, newposicion, newVelocidad, newTurnoActivacionHaste
end

for key, currentAccion in ipairs(acciones)
do
    --print("antes", health, x, key)
    health, x, v, turnoActivacionHaste = efectuarAccions(health, x, v, key, turnoActivacionHaste, currentAccion)
    if (health <= 0)
    then
        print("tukeaste")
        break
    end
end

if (health > 0 and x >= 10)
then
    print ("tu posicion es ", x, "y tu hp es", health)
    print("eres buff doge")
else
    print ("tu posicion es ", x, "y tu hp es", health)
    print("eres cheems")
end