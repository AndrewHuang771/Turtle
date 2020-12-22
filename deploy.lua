--deploy code for master turtle to run
--Item slot 13: Fuel
--Item slot 14: Floppy with worker and startup code
--Item slot 15: Disk Drive
--Item slot 16: Mining Turtles

turtle.select(13)
turtle.refuel(1)


for i=1, 1, 1 do
    --everything to deploy a worker
    turtle.digUp()
    turtle.digDown()
    turtle.select(15)
    turtle.placeUp()
    turtle.select(14)
    turtle.dropUp()
    turtle.down()
    turtle.select(16)
    turtle.placeUp()
    turtle.select(13)
    turtle.dropUp(1)

    --wait for worker turle above it to leave
    while(turtle.inspectUp()) do
    end

    --retrieve disk drive and floppy
    turtle.up()
    turtle.select(14)
    turtle.digUp()
    turtle.select(1)

    --advance forward 2
    turtle.dig()
    turtle.forward()
    turtle.digUp()
    turtle.digDown()
    turtle.dig()
    turtle.forward()
end

