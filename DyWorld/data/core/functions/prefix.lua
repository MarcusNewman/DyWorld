dy = "dyworld-"
dyworld_debug_prefix = "dyworld-debug-"

-- graphical
dyworld_path_icon = "__DyWorld__/graphics/icons/"
dyworld_path_fluid = "__DyWorld__/graphics/fluids/"
dyworld_path_tech = "__DyWorld__/graphics/technology/"
dyworld_path_entity = "__DyWorld__/graphics/entity/"
dyworld_path_tile = "__DyWorld__/graphics/tiles/"
dyworld_path_item_group = "__DyWorld__/graphics/item-group/"
dyworld_path_icon_temp = "__DyWorld__/graphics/questionmark.png"

Order_Tiers = {
	[1] = "d",
	[2] = "e",
	[3] = "f",
	[4] = "g",
	[5] = "h",
	[6] = "i",
	[7] = "j",
	[8] = "k",
	[9] = "l",
	[10] = "m",
	["single"] = "a",
	["duo"] = "b",
	["trio"] = "c",
}

Metal_Tiers = {
	["stone"] = 1,
	["wood"] = 1,
	["silver"] = 2,
	["nickel"] = 2,
	["tin"] = 2,
	["copper"] = 2,
	["iron"] = 2,
	["coal"] = 2,
	["gold"] = 3,
	["steel"] = 3,
	["bronze"] = 3,
	["lead"] = 3,
	["cobalt"] = 4,
	["invar"] = 4,
	["electrum"] = 4,
	["uranium"] = 5,
	["stainless-steel"] = 5,
	["arditium"] = 5,
	["titanium"] = 6,
	["tungsten"] = 6,
	["electranium"] = 7,
	["arditium-tungstenate"] = 7,
	["tungstvar"] = 8,
	["neutronium"] = 9,
	["neutrobaltium"] = 10,
}

Damage_Tiers = {
	["water"] = 1,
	["earth"] = 2,
	["electric"] = 3,
	["chemical"] = 4,
	["poison"] = 5,
	["fire"] = 6,
	["physical"] = 7,
	["impact"] = 8,
	["explosion"] = 9,
	["sonic"] = 10,
	["fusion"] = 11,
	["laser"] = 12,
	["lightning"] = 13,
	["acid"] = 14,
	["plasma"] = 15,
	["gas"] = 16,
	["fungal"] = 17,
	["lava"] = 18,
	["fission"] = 19,
	["ice"] = 20,
	["nuclear"] = 20,
}

Damage_Opposite = {
	["nuclear"] = "earth",
	["electric"] = "earth",
	["poison"] = "water",
	["acid"] = "explosion",
	["gas"] = "sonic",
	["water"] = "lightning",
	["fire"] = "water",
	["lightning"] = "earth",
	["fungal"] = "fire",
	["plasma"] = "fusion",
	["laser"] = "sonic",
	["lava"] = "ice",
	["earth"] = "explosion",
	["fission"] = "plasma",
	["chemical"] = "impact",
	["physical"] = "laser",
	["explosion"] = "sonic",
	["impact"] = "chemical",
	["sonic"] = "explosion",
	["ice"] = "lava",
	["fusion"] = "plasma",
}

Enemy_Names_Scales = {
	["small"] = 0.5,
	["medium"] = 0.7,
	["big"] = 1,
	["huge"] = 1.2,
	["behemoth"] = 1.5,
}