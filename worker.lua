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


--go until fuel is half
for i=1, half_fuel, 1 do
    turtle.forward()
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

--come back
for i=1, half_fuel, 1 do
    turtle.digUp()
    turtle.digDown()
    turtle.dig()
    turtle.forward()
end

turtle.digUp()
turtle.digDown()
