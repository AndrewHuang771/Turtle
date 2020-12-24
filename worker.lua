local SLOT_COUNT = 16
local block_counter = 0
local GARBAGE_INTERVAL = 16

WANTED_ITEMS = {
    ["minecraft:obsidian"]=true,
    ["minecraft:diamond"]=true,
    ["minecraft:iron_ore"]=true,
    ["minecraft:gold_ore"]=true,
    ["minecraft:coal"]=true,
    ["minecraft:emerald"]=true,
    ["minecraft:lapis_lazuli"]=true,
    ["draconicevolution:draconium_dust"]=true,
    ["fluxnetworks:flux"]=true,
    ["projectred-core:resource_item"]=true,
    ["thermalfoundation:ore"]=true,
    ["ic2:resource"]=true
}

function filterInventory(filter_set)
    for slot = 1, SLOT_COUNT, 1 do
        local item_data = turtle.getItemDetail(slot)
        if item_data then
            if not filter_set[item_data["name"]] then
                turtle.select(slot)
                turtle.dropDown()
            end
        end
    end
    turtle.select(1)
end

function dig(num_blocks)
    for i=1, num_blocks, 1 do
        if block_counter == GARBAGE_INTERVAL then
            filterInventory(WANTED_ITEMS)
            block_counter = 0
        end
        block_counter = block_counter + 1
        turtle.digUp()
        turtle.digDown()
        turtle.dig()
        while not turtle.forward() do
            turtle.dig()
        end
    end
end

-- Code for worker turtle

--Wait for fuel
while(turtle.getFuelLevel() == 0) do
    turtle.refuel()
end

local total_fuel = turtle.getFuelLevel()
half_fuel = (total_fuel/2) - 1

--turn and start digging
turtle.turnLeft()
turtle.dig()
turtle.forward()

--go until fuel is half
dig(half_fuel)

turtle.digUp()
turtle.digDown()

--turn around
turtle.turnRight()
turtle.dig()
while not turtle.forward() do
    turtle.dig()
end
turtle.turnRight()

--come back
dig(half_fuel)

turtle.digUp()
turtle.digDown()

filterInventory(WANTED_ITEMS)