local SLOT_COUNT = 16
local ERROR_NOT_FOUND = -1

WANTED_ITEMS = {
    ["minecraft:diamond"]=true,
    ["minecraft:iron_ore"]=true,
	["minecraft:gold_ore"]=true
}

function searchInventory(item_name)
	for slot = 1, SLOT_COUNT, 1 do
		local item_data = turtle.getItemDetail(slot)
		if item_data then
			if item_data["name"] == item_name then
				return slot
			end
		end
	end
	return ERROR_NOT_FOUND
end

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
end

function printInventory()
	for slot = 1, SLOT_COUNT, 1 do
		local item_data = turtle.getItemDetail(slot)
		if item_data then
			print(item_data["name"])
		end
	end
end

function emptyInventory()
	filterInventory({})
end

