require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

local Data_Table = {
	{
		Name = "logistics",
		Icon = {{icon = "__base__/graphics/technology/logistics.png"}},
		Pre_Req_Above = 3,
		Tiers = 10,
		Count = 100,
		Military = false,
	},
	{
		Name = "storage-solutions",
		Icon = {{icon = dyworld_path_tech.."warehouse-research.png"}},
		Pre_Req_Above = 2,
		Tiers = 5,
		Count = 50,
		Military = false,
	},
	{
		Name = "construction-robotics",
		Icon = {{icon = "__base__/graphics/technology/logistics.png"}},
		Pre_Req_Above = 3,
		Tiers = 10,
		Count = 100,
		Military = false,
	},
	{
		Name = "logistic-robotics",
		Icon = {{icon = "__base__/graphics/technology/logistics.png"}},
		Pre_Req_Above = 3,
		Tiers = 10,
		Count = 100,
		Military = false,
	},
}

for k,v in pairs(Data_Table) do
	for i = 1,v.Tiers do
		if i == 1 then
			if data.raw.technology[v.Name] or data.raw.technology[v.Name.."-1"] then
				-- do nothing
			else
				DyWorld_Tech_Add(v, i)
			end		
		elseif i >= 2 then
			if not data.raw.technology[v.Name.."-"..i] then
				DyWorld_Tech_Add(v, i)
			end	
		end
	end
end
