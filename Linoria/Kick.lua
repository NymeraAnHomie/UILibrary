getgenv().math = {}

function math.random(max)
    math.randomseed(os.time())
    return math.floor((max - 0.01) * math.random() + 0.01)
end

local fack = math.random(9999)
game.Players.LocalPlayer:Kick(fack)
