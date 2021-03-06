require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"


local Data_Table = {
	{
		Name = "wood",
		Time = 300,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["acorn"] = 1,
		},
		-- Water ingredient is added at bottom of file because of temperature
		Enabled = true,
		Category = dy.."farming",
		Multi_Output = {
			{type = "item", name = "wood", amount_min = 1, amount_max = 25, probability = 0.95},
			{type = "item", name = "acorn", amount_min = 1, amount_max = 4, probability = 0.55},
		},
		Icon = data.raw.item.wood.icon,
		Subgroup = "0-resource",
	},
	{
		Name = "wood-2",
		Time = 600,
		Recipe_Enabled = true,
		Recipe_Ingredients = {
			["acorn"] = 1,
		},
		-- Water ingredient is added at bottom of file because of temperature
		Enabled = true,
		Category = dy.."farming-2",
		Multi_Output = {
			{type = "item", name = "wood", amount_min = 10, amount_max = 50, probability = 0.95},
			{type = "item", name = "acorn", amount_min = 1, amount_max = 1, probability = 1},
		},
		Icon = data.raw.item.wood.icon,
		Subgroup = "0-resource",
	},
}

for k,v in pairs(Data_Table) do
	if not data.raw.recipe[v.Name] then
		DyWorld_Master_Recipe_Creator(v)
	end
end	

local INSERT = {type = "fluid", name = "water", amount = 250, minimum_temperature = 10, maximum_temperature = 25}
table.insert(data.raw.recipe["wood"].normal.ingredients, INSERT)
local INSERT = {type = "fluid", name = "water", amount = Expensive_Check(250), minimum_temperature = 10, maximum_temperature = 25}
table.insert(data.raw.recipe["wood"].expensive.ingredients, INSERT)

local INSERT = {type = "fluid", name = "water", amount = 500, minimum_temperature = 25, maximum_temperature = 60}
table.insert(data.raw.recipe["wood-2"].normal.ingredients, INSERT)
local INSERT = {type = "fluid", name = "water", amount = Expensive_Check(500), minimum_temperature = 25, maximum_temperature = 60}
table.insert(data.raw.recipe["wood-2"].expensive.ingredients, INSERT)