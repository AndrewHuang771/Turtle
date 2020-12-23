--deploy code for master turtle to run
--Item slot 13: Fuel
--Item slot 14: Floppy with worker and startup code
--Item slot 15: Disk Drive
--Item slot 16: Mining Turtles

FUEL_SLOT = 13
FLOPPY_DISK_SLOT = 14
DISK_DRIVE_SLOT = 15
MINING_TURTLE_SLOT = 16
AMOUNT_OF_MASTER_FUEL = 1
WORKER_SPACING = 2

NUMBER_OF_WORKERS = 1
AMOUNT_OF_WORKER_FUEL = 1   --currently using coal (80 moves per coal)

turtle.select(FUEL_SLOT)
turtle.refuel(AMOUNT_OF_MASTER_FUEL)

--everything to deploy a worker
function deployWorker(num_fuel)
    if turtle.detectUp() then
        turtle.digUp()
    end
    if turtle.detectDown() then
        turtle.digDown()
    end
    turtle.select(DISK_DRIVE_SLOT)
    turtle.placeUp()
    turtle.select(FLOPPY_DISK_SLOT)
    turtle.dropUp()
    turtle.down()
    turtle.select(MINING_TURTLE_SLOT)
    turtle.placeUp()
    turtle.select(FUEL_SLOT)
    turtle.dropUp(num_fuel)
end

--retrieve disk drive and floppy
function retrieveDisk()
    turtle.up()
    turtle.select(FLOPPY_DISK_SLOT)
    turtle.digUp()
    turtle.select(1)
end

--advance forward num_blocks
function dig(num_blocks)
    for i=1, num_blocks, 1 do
        turtle.dig()
        turtle.forward()
        turtle.digUp()
        turtle.digDown()
    end
end

for i=1, NUMBER_OF_WORKERS, 1 do
    
    deployWorker(AMOUNT_OF_WORKER_FUEL)

    --wait for worker turtle above it to leave
    while(turtle.inspectUp()) do
    end

    retrieveDisk()

    dig(WORKER_SPACING)
end
