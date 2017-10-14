require "data/prefix"

local Data_Table = {
	{
		Name = "chitin",
		Icon = dyworld_path_icon.."chitin.png",
		Stack = 500,
		Subgroup = "intermediates",
	},
	{
		Name = "crystal",
		Icon = dyworld_path_icon.."crystal.png",
		Stack = 25,
		Subgroup = "intermediates",
	},
	{
		Name = "crystai",
		Icon = dyworld_path_icon.."crystai.png",
		Stack = 25,
		Subgroup = "intermediates",
	},
	{
		Name = "obsidian",
		Icon = dyworld_path_icon.."obsidian.png",
		Stack = 50,
		Subgroup = "intermediates",
	},
	{
		Name = "sand",
		Icon = dyworld_path_icon.."sand.png",
		Stack = 500,
		Subgroup = "intermediates",
	},
	{
		Name = "frame",
		Icon = dyworld_path_icon.."frame.png",
		Stack = 200,
		Subgroup = "intermediates",
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 3,
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{"iron-plate", 15},{"iron-stick", 4},{"copper-cable", 12}},
	},
	{
		Name = "heater",
		Icon = dyworld_path_icon.."heater.png",
		Stack = 200,
		Subgroup = "intermediates",
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 4.5,
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{dy.."frame", 1},{"electronic-circuit", 4},{"copper-cable", 9}},
	},
	{
		Name = "blade",
		Icon = dyworld_path_icon.."blade.png",
		Stack = 200,
		Subgroup = "intermediates",
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 1,
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{"iron-plate",2},{"iron-stick",1},{"stone",2}},
	},
	{
		Name = "gearbox",
		Icon = dyworld_path_icon.."gearbox.png",
		Stack = 200,
		Subgroup = "intermediates",
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 2.5,
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{"iron-plate",15},{"iron-stick",4},{"copper-cable",12}},
	},
	{
		Name = "processing-logic",
		Icon = dyworld_path_icon.."processing-logic.png",
		Stack = 50,
		Subgroup = "intermediates",
		Recipe = true,
		Recipe_Without_Tech = false,
		Recipe_Craft_Time = 15,
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{dy.."processing-advanced", 4},{"copper-cable", 25},{dy.."crystal", 1}},
		Tech_Name = "advanced-electronics-2",
	},
	{
		Name = "processing-advanced",
		Icon = dyworld_path_icon.."processing-advanced.png",
		Stack = 100,
		Subgroup = "intermediates",
		Recipe = true,
		Recipe_Without_Tech = false,
		Recipe_Craft_Time = 10,
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{"processing-unit", 3},{"advanced-circuit", 1},{dy.."steel-stick", 4},{dy.."binding-steel", 1}}, 
		Tech_Name = "advanced-electronics-2",
	},
	{
		Name = "glass",
		Icon = dyworld_path_icon.."glass.png",
		Stack = 200,
		Subgroup = "intermediates",
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 2,
		Recipe_Category = "smelting",
		Recipe_Result_Count = 5,
		Recipe_Ingredients = {{dy.."sand", 3}},
	},
	{
		Name = "rotor",
		Icon = dyworld_path_icon.."rotor.png",
		Stack = 200,
		Subgroup = "intermediates",
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 1.5,
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{dy.."blade", 4},{"iron-stick", 2},{"copper-cable",3},{dy.."frame", 1}},
	},
	{
		Name = "stone-gear",
		Icon = dyworld_path_icon.."stone-gear.png",
		Stack = 200,
		Subgroup = "intermediates",
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{"stone", 2}},
	},
	{
		Name = "steel-gear",
		Icon = dyworld_path_icon.."steel-gear.png",
		Stack = 200,
		Subgroup = "intermediates",
		Recipe = true,
		Recipe_Without_Tech = false,
		Recipe_Craft_Time = 0.5,
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{"steel-plate", 2}},
		Tech_Name = "steel-processing",
	},
	{
		Name = "solar-cell",
		Icon = dyworld_path_icon.."solar-cell.png",
		Stack = 50,
		Subgroup = "intermediates",
		Recipe = true,
		Recipe_Without_Tech = false,
		Recipe_Craft_Time = 2.5,
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{"copper-plate", 3},{dy.."binding-copper", 2},{dy.."steel-stick", 2}},
		Tech_Name = "solar-energy",
	},
	{
		Name = "battery-pack",
		Icon = dyworld_path_icon.."battery-pack.png",
		Stack = 50,
		Subgroup = "intermediates",
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 2.5,
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{"copper-plate", 3},{dy.."binding-copper", 2},{"battery", 5},{"plastic-bar", 2}},
	},
	{
		Name = "steel-stick",
		Icon = dyworld_path_icon.."steel-stick.png",
		Stack = 200,
		Subgroup = "intermediates",
		Recipe = true,
		Recipe_Without_Tech = false,
		Recipe_Craft_Time = 0.5,
		Recipe_Result_Count = 2,
		Recipe_Ingredients = {{"steel-plate", 1}},
		Tech_Name = "steel-processing",
	},
	{
		Name = "stone-stick",
		Icon = dyworld_path_icon.."stone-stick.png",
		Stack = 200,
		Subgroup = "intermediates",
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Result_Count = 2,
		Recipe_Ingredients = {{"stone", 1}},
	},
	{
		Name = "binding-copper",
		Icon = dyworld_path_icon.."binding-copper.png",
		Stack = 200,
		Subgroup = "intermediates",
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Result_Count = 4,
		Recipe_Ingredients = {{"copper-plate", 1},{"copper-cable", 3}},
	},
	{
		Name = "binding-iron",
		Icon = dyworld_path_icon.."binding-iron.png",
		Stack = 200,
		Subgroup = "intermediates",
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Result_Count = 4,
		Recipe_Ingredients = {{"iron-plate", 1},{"copper-cable", 3}},
	},
	{
		Name = "binding-steel",
		Icon = dyworld_path_icon.."binding-steel.png",
		Stack = 200,
		Subgroup = "intermediates",
		Recipe = true,
		Recipe_Without_Tech = false,
		Recipe_Craft_Time = 0.5,
		Recipe_Result_Count = 4,
		Recipe_Ingredients = {{"steel-plate", 1},{"copper-cable", 3}},
		Tech_Name = "steel-processing",
	},
	{
		Name = "binding-chitin",
		Icon = dyworld_path_icon.."binding-chitin.png",
		Stack = 200,
		Subgroup = "intermediates",
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Result_Count = 4,
		Recipe_Ingredients = {{dy.."chitin", 2}},
	},
	{
		Name = "logistic-unit",
		Icon = dyworld_path_icon.."logistic-unit.png",
		Stack = 50,
		Subgroup = "intermediates",
		Recipe = true,
		Recipe_Without_Tech = false,
		Recipe_Craft_Time = 0.5,
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{"processing-unit", 3},{"copper-cable", 7},{"iron-plate", 4}},
		Tech_Name = "robotics",
	},
	{
		Name = "wood-stick",
		Icon = dyworld_path_icon.."wood-stick.png",
		Stack = 200,
		Subgroup = "intermediates",
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Result_Count = 4,
		Recipe_Ingredients = {{"wood", 1}},
	},
	{
		Name = "resin",
		Icon = dyworld_path_icon.."resin.png",
		Stack = 200,
		Subgroup = "intermediates",
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 0.5,
		Recipe_Result_Count = 3,
		Recipe_Ingredients = {{"raw-wood", 1}},
	},
	{
		Name = "rubber",
		Icon = dyworld_path_icon.."rubber.png",
		Stack = 200,
		Subgroup = "intermediates",
		Recipe = true,
		Recipe_Without_Tech = true,
		Recipe_Craft_Time = 2.5,
		Recipe_Category = "smelting",
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{dy.."resin", 1}},
	},
	{
		Name = "controller",
		Icon = dyworld_path_icon.."controller.png",
		Stack = 200,
		Subgroup = "intermediates",
		Recipe = true,
		Recipe_Without_Tech = false,
		Recipe_Craft_Time = 10,
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{dy.."housing", 1}, {"iron-plate",3}, {"steel-plate",1}, {"copper-cable",4}, {"advanced-circuit",3}, {"electronic-circuit",5}, {"plastic-bar",3}},
		Tech_Name = "advanced-electronics",
	},
	{
		Name = "housing",
		Icon = dyworld_path_icon.."housing.png",
		Stack = 200,
		Subgroup = "intermediates",
		Recipe = true,
		Recipe_Without_Tech = false,
		Recipe_Craft_Time = 2.5,
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{"iron-plate",3}, {"steel-plate",1}, {"copper-cable",4}},
		Tech_Name = "steel-processing",
	},
	{
		Name = "intake",
		Icon = dyworld_path_icon.."intake.png",
		Stack = 200,
		Subgroup = "intermediates",
		Recipe = true,
		Recipe_Without_Tech = false,
		Recipe_Craft_Time = 2.5,
		Recipe_Result_Count = 1,
		Recipe_Ingredients = {{dy.."housing", 1}, {"iron-plate",3}},
		Tech_Name = "steel-processing",
	},
	{
		Name = "wood-seed",
		Icon = dyworld_path_icon.."intake.png",
		Stack = 200,
		Subgroup = "intermediates",
	},
}

for k,v in pairs(Data_Table) do
data:extend(
	{
		DyWorld_Item(v),
	})
	if v.Recipe then
		data:extend(
		{
			DyWorld_Recipe(v),
		})
		if not v.Recipe_Without_Tech then
			local result = {type = "unlock-recipe", recipe = dy..v.Name}
			table.insert(data.raw.technology[v.Tech_Name].effects,result)
		end
	end
end