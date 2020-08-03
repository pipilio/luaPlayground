#!/usr/bin/lua5.3
local accionesPosibles = {"velocidad", "caminar", "heal", "recibir daño", "saltar"}
local mundo = {}
local jugadorDefault = { ['health'] = 15, ['x'] = 0,['v'] = 1, ['turnoActivacionHaste'] = 0 }

-- asigna cantidadJugadores jugadores al mundo
-- inicializados con el tabla player
function inicializarMundo(m, cantidadJugadores, player)
    for i = 1,cantidadJugadores,1
    do
        table.insert(m, copiarJugador(player))
    end
end

-- muestra estado del jugador j
function mostrarDatosJugador(j)
    print('     health', j.health)
    print('     x', j.x)
    print('     v', j.v)
    print('     turnoActivacionHaste', j.turnoActivacionHaste)
end

-- muestra el estado de todos los jugadores del mundo m
function mostrarMundo(m)
    for k, jugador in ipairs(m)
    do
        print(k, jugador)
        mostrarDatosJugador(jugador)
    end
end

function efectuarAccions(player, turno, accion)
    local newhp, newposicion, newVelocidad, newtah = player.health, player.x, player.v, player.turnoActivacionHaste
    if (accion == "caminar")
    then
        newposicion = newposicion + newVelocidad
        -- print("has caminao, tu posición es", newposicion)
    elseif (accion == "saltar")
    then
        -- print("saltaste, no sirve de nada")
    elseif (accion == "recibir daño")
    then
        newhp = newhp - 1
        -- print("te han pegao, tu hp quedó en", newhp)
    elseif (accion == "heal")
    then
        newhp = newhp + 1
        -- print("te han curao, tu hp quedó en", newhp)
    elseif (accion == "velocidad")
    then
        newVelocidad = newVelocidad * 2
        newtah = turno
        -- print("HASTE")
    else
        -- print("acción desconocida, no hice nada")
    end
    if (newtah ~= 0 and turno - newtah >= 2)
    then
        -- print("te quito el haste")
        newVelocidad = 1
        newtah = 0
    end
    return newhp, newposicion, newVelocidad, newtah
end

-- retorna un arreglo con numAcciones acciones aleatorias
-- desde el arreglo actions
function generaAcciones(numAcciones, actions)
    local arreglo = {}
    for i = 1,numAcciones,1
    do
        local indice = math.random(1,5)
        local accion = actions[indice]
        table.insert(arreglo, accion)
    end
    return arreglo
end

-- aplica un conjunto de acciones sobre un jugador p
function aplicaAcciones(actions, p)
    for key, currentAccion in ipairs(actions)
    do
        p.health, p.x, p.v, p.turnoActivacionHaste = efectuarAccions( p, key, currentAccion)
        if (p.health <= 0)
        then
            print("tukeaste")
            break
        end
    end
end


function jugar(m, cantidadAcciones, acciones)
    for k, jugador in ipairs(m)
    do
        local actions = generaAcciones(cantidadAcciones, acciones)
        -- for k,v in ipairs(actions)
        -- do
        --     -- print(k,v)
        -- end
        aplicaAcciones(actions, jugador)
    end
end

function copiarJugador(player)
    local newPlayer = {}
    newPlayer.health, newPlayer.x, newPlayer.v, newPlayer.turnoActivacionHaste = player.health, player.x, player.v, player.turnoActivacionHaste
    return newPlayer
end

-- inicializar la semilla aleatoria
math.randomseed( os.time() )

inicializarMundo(mundo, 500000, jugadorDefault)
--mostrarMundo(mundo)
jugar(mundo, 150, accionesPosibles)
--mostrarMundo(mundo)
