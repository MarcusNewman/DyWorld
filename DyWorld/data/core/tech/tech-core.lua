require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

local Data_Table = {
	{
		Name = "metallurgy",
		Icon = {{icon = dyworld_path_icon.."blast-furnace.png", scale = 2}},
		Icon_Size = 32,
		Pre_Req_Above = 2,
		Tiers = 10,
		Count = 50,
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