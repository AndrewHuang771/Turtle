--deploy code for master turtle to run
--Item slot 13: Fuel
--Item slot 14: Floppy with worker and startup code
--Item slot 15: Disk Drive
--Item slot 16: Mining Turtles

--command line arguments
args = {...}


FUEL_SLOT = 13
FLOPPY_DISK_SLOT = 14
DISK_DRIVE_SLOT = 15
MINING_TURTLE_SLOT = 16
WORKER_SPACING = 2

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

        while not turtle.forward() do
            turtle.dig()
        end

        turtle.digUp()
        turtle.digDown()
    end
end


--get arguments
length = args[1]
width = args[2]

num_workers = math.floor(length/2)
print("num_workers = ", num_workers)
worker_fuel = math.ceil(width/40)
print("worker_fuel = ", worker_fuel)
master_fuel = math.ceil(length/80)
print("master_fuel = ", master_fuel)

turtle.select(FUEL_SLOT)
turtle.refuel(master_fuel)

for i=1, num_workers, 1 do
    
    deployWorker(worker_fuel)

    --wait for worker turtle above it to leave
    while(turtle.up() == false) do
    end

    retrieveDisk()

    dig(WORKER_SPACING)
end
