require "data/core/functions/prefix"
require "data/core/functions/colors"

local Data_Table = {
	{
		Name = dy.."farming",
		Type = "recipe"
	},
	{
		Name = dy.."farming-2",
		Type = "recipe"
	},
	{
		Name = dy.."farming-3",
		Type = "recipe"
	},
	{
		Name = dy.."farming-4",
		Type = "recipe"
	},
	{
		Name = dy.."farming-5",
		Type = "recipe"
	},
	{
		Name = dy.."pasture",
		Type = "recipe"
	},
	{
		Name = dy.."air-filter",
		Type = "recipe"
	},
	{
		Name = dy.."recycling",
		Type = "recipe"
	},
	{
		Name = dy.."melting",
		Type = "recipe"
	},
	{
		Name = dy.."melting-2",
		Type = "recipe"
	},
	{
		Name = dy.."melting-3",
		Type = "recipe"
	},
	{
		Name = dy.."melting-4",
		Type = "recipe"
	},
	{
		Name = dy.."melting-5",
		Type = "recipe"
	},
	{
		Name = dy.."casting",
		Type = "recipe"
	},
	{
		Name = dy.."compressor",
		Type = "recipe"
	},
	{
		Name = dy.."forging-gear",
		Type = "recipe"
	},
	{
		Name = dy.."forging-cable",
		Type = "recipe"
	},
	{
		Name = dy.."forging-stick",
		Type = "recipe"
	},
	{
		Name = "super",
		Type = "module"
	},
	{
		Name = "pollution-1",
		Type = "module"
	},
	{
		Name = "pollution-2",
		Type = "module"
	},
	{
		Name = "laser",
		Type = "ammo"
	},
	{
		Name = "plasma",
		Type = "ammo"
	},
	{
		Name = "beam",
		Type = "ammo"
	},
	{
		Name = "sniper",
		Type = "ammo"
	},
	{
		Name = "laser-turret",
		Type = "ammo"
	},
	{
		Name = "beam-turret",
		Type = "ammo"
	},
	{
		Name = "plasma-turret",
		Type = "ammo"
	},
}

function DyWorld_Damage_Type(NAME)
  local result =
  {
    type = "damage-type",
    name = NAME
  }
  return result
end

function DyWorld_Resource_Type(NAME)
  local result =
  {
    type = "resource-category",
    name = NAME
  }
  return result
end

function DyWorld_Recipe_Type(NAME)
  local result =
  {
    type = "recipe-category",
    name = NAME
  }
  return result
end

function DyWorld_Noise_Type(NAME)
  local result =
  {
    type = "noise-layer",
    name = NAME
  }
  return result
end

function DyWorld_Ammo_Type(NAME)
  local result =
  {
    type = "ammo-category",
    name = NAME
  }
  return result
end

function DyWorld_Equipment_Category(NAME)
  local result =
  {
    type = "equipment-category",
    name = NAME
  }
  return result
end

function DyWorld_Module_Category(NAME)
  local result =
  {
    type = "module-category",
    name = NAME
  }
  return result
end

function DyWorld_Autoplace_Type(NAME)
  local result =
  {
    type = "autoplace-control",
    name = NAME,
    richness = true,
    order = NAME
  }
  return result
end

function DyWorld_Equipment_Grid_Type(NAME, WIDTH, HEIGHT)
  local result =
  {
    type = "equipment-grid",
    name = NAME,
    width = WIDTH,
    height = HEIGHT,
    equipment_categories = {"armor"}
  }
  return result
end

for k,v in pairs(Data_Table) do
	if v.Type == "dmg" then
		data:extend(
			{
				DyWorld_Damage_Type(v.Name)
			})
	elseif v.Type == "resource" then
		data:extend(
			{
				DyWorld_Resource_Type(v.Name)
			})
	elseif v.Type == "recipe" then
		data:extend(
			{
				DyWorld_Recipe_Type(v.Name)
			})
	elseif v.Type == "ammo" then
		data:extend(
			{
				DyWorld_Ammo_Type(v.Name)
			})
	elseif v.Type == "equipment" then
		data:extend(
			{
				DyWorld_Equipment_Category(v.Name)
			})
	elseif v.Type == "noise" then
		data:extend(
			{
				DyWorld_Noise_Type(v.Name)
			})
	elseif v.Type == "autoplace" then
		data:extend(
			{
				DyWorld_Autoplace_Type(v.Name)
			})
	elseif v.Type == "equipment_grid" then
		data:extend(
			{
				DyWorld_Equipment_Grid_Type(v.Name, v.Width, v.Height)
			})
	elseif v.Type == "module" then
		data:extend(
			{
				DyWorld_Module_Category(v.Name)
			})
	end
end