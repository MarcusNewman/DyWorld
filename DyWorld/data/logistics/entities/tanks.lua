require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

if settings.startup["DyWorld_Logistics"].value then

for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Entity and v.DyWorld.Entity.Pipe then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("storage-tank", "storage-tank", v.DyWorld.Name.."-storage-tank", true)
	DyWorld_Prototype_Entity.localised_name = {"looped-name.pipe-3", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Entity.max_health = 2500 * v.DyWorld.Tier
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.pictures.picture.sheets[1].tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.pictures.picture.sheets[1].hr_version.tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.fluid_box.base_area = v.DyWorld.Entity.Pipe.Amount * (25 * v.DyWorld.Tier)
	DyWorld_Prototype_Entity.resistances = v.DyWorld.Resistances
	DyWorld_Prototype_Entity.hide_resistances = settings.startup["DyWorld_Hide_Resistances"].value
	DyWorld_Prototype_Entity.fast_replaceable_group = "storage-tank"
	if v.DyWorld.Entity.Pipe.Next then
		DyWorld_Prototype_Entity.next_upgrade = v.DyWorld.Entity.Pipe.Next.."-storage-tank"
	end
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = "__base__/graphics/icons/storage-tank.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "storage-tank", v.DyWorld.Name.."-storage-tank", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.pipe-3", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.localised_description = {"looped-name.pipe-1-tp", v.DyWorld.Entity.Pipe.Amount}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.stack_size = 200
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/storage-tank.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "storage-tank", v.DyWorld.Name.."-storage-tank", true)
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {}
	DyWorld_Prototype_Recipe.normal.result = v.DyWorld.Name.."-storage-tank"
	DyWorld_Prototype_Recipe.expensive.ingredients = {}
	DyWorld_Prototype_Recipe.expensive.result = v.DyWorld.Name.."-storage-tank"
	DyWorld_Prototype_Recipe.ingredients = nil
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.pipe-3", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Recipe.energy_required = 0
	DyWorld_Prototype_Recipe.normal.energy_required = (0.5 * v.DyWorld.Tier) * v.DyWorld.Tier
	DyWorld_Prototype_Recipe.expensive.energy_required = (0.5 * v.DyWorld.Tier) * v.DyWorld.Tier
	if v.DyWorld.Tier == 1 then 
		DyWorld_Prototype_Recipe.enabled = true
		DyWorld_Prototype_Recipe.normal.enabled = true
		DyWorld_Prototype_Recipe.expensive.enabled = true
	else
		DyWorld_Prototype_Recipe.enabled = false
		DyWorld_Prototype_Recipe.normal.enabled = false
		DyWorld_Prototype_Recipe.expensive.enabled = false
	end

	data:extend({DyWorld_Prototype_Entity, DyWorld_Prototype_Item, DyWorld_Prototype_Recipe})
	
	if data.raw.technology["fluid-handling-"..v.DyWorld.Tier] then
		DyWorld_Add_To_Tech("fluid-handling-"..v.DyWorld.Tier, v.DyWorld.Name.."-storage-tank")
	end
	
	if v.DyWorld.Entity.Pipe.Ingredients then
		for q,a in pairs(v.DyWorld.Entity.Pipe.Ingredients) do
			local Ingredient = {type = "item", name = q, amount = math.floor(a * 50)}
			local Ingredient_2 = {type = "item", name = q, amount = Expensive_Check(a * 50)}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-storage-tank"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-storage-tank"].expensive.ingredients, Ingredient_2)
		end
	end
	if v.DyWorld.Entity.Pipe.Previous then
		local Ingredient = {type = "item", name = v.DyWorld.Entity.Pipe.Previous.."-storage-tank", amount = 1}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-storage-tank"].normal.ingredients, Ingredient)
	end
end
end

end