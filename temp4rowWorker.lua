-- Code for worker turtle

--Wait for fuel
while(turtle.getFuelLevel() == 0) do
    turtle.refuel()
end

local total_fuel = turtle.getFuelLevel()
half_fuel = (total_fuel/4) - 1



--go until fuel is half
for j=1, 2, 1 do
    for i=1, half_fuel, 1 do
        turtle.digUp()
        turtle.digDown()
        turtle.dig()
        turtle.forward()
    end
    turtle.digUp()
    turtle.digDown()

    --turn around
    turtle.turnRight()
    turtle.dig()
    turtle.forward()
    turtle.turnRight()

    for i=1, half_fuel, 1 do
        turtle.digUp()
        turtle.digDown()
        turtle.dig()
        turtle.forward()
    end
    turtle.digUp()
    turtle.digDown()

    --turn around
    turtle.turnLeft()
    turtle.dig()
    turtle.forward()
    turtle.turnLeft()
end

turtle.digUp()
turtle.digDown()
