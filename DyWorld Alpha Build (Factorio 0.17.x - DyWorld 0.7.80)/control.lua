require "roadmap"
require "script/functions"
require "script/startup"
require "script/migration"
require "script/gui/gui_0"
require "script/gui/gui_1"
require "script/gui/gui_2"
require "script/gui/gui_3"
require "script/gui/gui_4"
require "script/gui/gui_5"
require "script/gui/gui_6"
require "script/gui/gui_click"
require "script/stats/functions"
require "script/generation/noise"
require "script/generation/world-generation"
require "script/functions/loaders"
require "script/functions/side-inserter"

debugger = false
debug_test = settings.startup["DyWorld_Debug"].value
Migrate_Debug = false

function debug(str, statement)
local seconds = math.floor(game.tick/60)
local minutes = math.floor(seconds/60)
local hours = math.floor(minutes/60)
	if not global.debug then global.debug = {} end
	table.insert(global.debug, ("("..hours..":"..(minutes-(hours*60))..":"..(seconds-(minutes*60))..") = "..str))
	if debugger then
		PlayerPrint("("..hours..":"..(minutes-(hours*60))..":"..(seconds-(minutes*60))..") = "..str)
	end
end

function PlayerPrint(message)
	for _,player in pairs(game.players) do
		player.print(message)
	end
end

-- game start hooks
script.on_init(function()
	Game_Startup()
end)

-- setting hooks

script.on_configuration_changed(function()
	Migrate_To_Next_Version()
	if Migrate_Debug then
		Migrate_Debug()
	end
end)

-- player hooks
script.on_event(defines.events.on_player_created, function(event)
	local player = game.players[event.player_index]
	local ID = event.player_index
	debug(ID)
	Player_Startup(player, ID)
	if not game.players[event.player_index].name == "Dysoch" then
		player.print({"dyworld.startup-1", (game.players[event.player_index].name)})
		if settings.startup["DyWorld_Story"].value then
			player.print({"dyworld.startup-story-wip"})
		end
	end
	--PlayerPrint({"dyworld_guide_gui.message"})
	debug(game.players[event.player_index].name.." created")
end)

script.on_event(defines.events.on_player_respawned, function(event)
	if global.dyworld.RPG_Mode == "normal" then
		local player = game.players[event.player_index]	
		local ID = event.player_index
		global.players[ID].Alive = true
		game.players[ID].get_inventory(defines.inventory.character_main).clear()
		game.players[ID].get_inventory(defines.inventory.character_guns).clear()
		game.players[ID].get_inventory(defines.inventory.character_ammo).clear()
		global.players[ID].Food = 100
		global.players[ID].Water = 100
		debug(game.players[event.player_index].name.." respawned")
	end
end)

script.on_event(defines.events.on_player_died, function(event)
	if global.dyworld.RPG_Mode == "normal" then
		local ID = event.player_index
		global.players[ID].Alive = false
		debug(game.players[event.player_index].name.." died")
	end
end)

script.on_event(defines.events.on_player_joined_game, function(event)
	if global.dyworld.RPG_Mode == "normal" then
		local ID = event.player_index
		global.players[ID].Playing = true
		debug(game.players[event.player_index].name.." joined game")
	end
end)

script.on_event(defines.events.on_player_left_game, function(event)
	if global.dyworld.RPG_Mode == "normal" then
		local ID = event.player_index
		global.players[ID].Playing = false
		debug(game.players[event.player_index].name.." left game")
	end
end)

-- game event hooks
script.on_event(defines.events.on_player_crafted_item, function(event)
	if global.dyworld.RPG_Mode == "normal" then
		IncrementerGlobal("crafted", event.item_stack.count, event.item_stack.name)
		IncrementerPersonal("crafted", event.item_stack.count, event.player_index, event.item_stack.name)
		XP_Full(event.player_index)
		Needs_Work(event.player_index, (event.item_stack.count*0.1), (event.item_stack.count*0.15))
	end
end)

script.on_event(defines.events.on_player_mined_item, function(event)
	if global.dyworld.RPG_Mode == "normal" then
		if event.item_stack.count >= 100 then
			IncrementerGlobal("mined", 100, event.item_stack.name)
			IncrementerPersonal("mined", 100, event.player_index, event.item_stack.name)
			XP_Full(event.player_index)
			Needs_Work(event.player_index, (100*0.15), (100*0.25))
		else
			IncrementerGlobal("mined", event.item_stack.count, event.item_stack.name)
			IncrementerPersonal("mined", event.item_stack.count, event.player_index, event.item_stack.name)
			XP_Full(event.player_index)
			Needs_Work(event.player_index, (event.item_stack.count*0.15), (event.item_stack.count*0.25))
		end
	end
end)

script.on_event(defines.events.on_picked_up_item, function(event)
	if global.dyworld.RPG_Mode == "normal" then
		if event.item_stack.count >= 100 then
			IncrementerGlobal("pickup", 100, event.item_stack.name)
			IncrementerPersonal("pickup", 100, event.player_index, event.item_stack.name)
			XP_Full(event.player_index)
			Needs_Work(event.player_index, (100*0.05), (100*0.025))
		else
			IncrementerGlobal("pickup", event.item_stack.count, event.item_stack.name)
			IncrementerPersonal("pickup", event.item_stack.count, event.player_index, event.item_stack.name)
			XP_Full(event.player_index)
			Needs_Work(event.player_index, (event.item_stack.count*0.05), (event.item_stack.count*0.025))
		end
	end
end)

script.on_event(defines.events.on_built_entity, function(event)
	if string.find(event.created_entity.name, "dyworld-", 1, true) and string.find(event.created_entity.name, "-loader", 1, true) then
		DyWorld_Loaders_Rotate(event)
	end
	if global.dyworld.RPG_Mode == "normal" then
		IncrementerGlobal("build", 1)
		IncrementerPersonal("build", 1, event.player_index)
		XP_Full(event.player_index)
		Needs_Work(event.player_index, 0.1, 0.05)
		Mark_Warfare_Location(event.created_entity.position.x, event.created_entity.position.y, true)
	end
	if not global.dyworld.Guide then global.dyworld.Guide = {} end
	if not global.dyworld.Guide[event.created_entity.type] then
		global.dyworld.Guide[event.created_entity.type] = true
	end
end)

script.on_event(defines.events.on_player_mined_entity, function(event)
    Mark_Warfare_Location(event.entity.position.x, event.entity.position.y, false)
end)

script.on_event(defines.events.on_robot_mined_entity, function(event)
    Mark_Warfare_Location(event.entity.position.x, event.entity.position.y, false)
end)

script.on_event(defines.events.on_robot_mined, function(event)
	if global.dyworld.RPG_Mode == "normal" then
		IncrementerGlobal("ghostmined", event.item_stack.count, event.item_stack.name)
		XP_All_Small()
	end
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
	if global.dyworld.RPG_Mode == "normal" then
		IncrementerGlobal("ghostbuild", 1)
		XP_All_Small()
		Mark_Warfare_Location(event.created_entity.position.x, event.created_entity.position.y, true)
	end
	if not global.dyworld.Guide then global.dyworld.Guide = {} end
	if not global.dyworld.Guide[event.created_entity.type] then
		global.dyworld.Guide[event.created_entity.type] = true
	end
end)

script.on_event(defines.events.on_sector_scanned, function(event)
	if global.dyworld.RPG_Mode == "normal" then
		IncrementerGlobal("scanned", 1)
		XP_All_Small()
	end
end)

script.on_event(defines.events.on_entity_died, function(event)
	if event.force.name == "player" then
		if global.dyworld.RPG_Mode == "normal" then
		IncrementerGlobal("killed", 1)
		XP_All_Small()
		end
	end
end)

script.on_event(defines.events.on_research_finished, function(event)
	IncrementerGlobal("research", game.forces.player.technologies[event.research.name].research_unit_count, event.research.name)
	for i=1,(game.forces.player.technologies[event.research.name].research_unit_count) do
		if global.dyworld.RPG_Mode == "normal" then
			XP_All_Full()
		end
	end
	global.dyworld.Research_Done = global.dyworld.Research_Done + 1
	debug("Finished "..event.research.name.." research")
end)

-- random generation
script.on_event(defines.events.on_chunk_generated, function(event)
	global.dyworld.Chunks = global.dyworld.Chunks + 1
	if math.random(1,5)==3 then
		Ruins_Spawner(event)
	end
	if global.dyworld.Chunks <= 100 then
		Ship_Spawner(event)
	end
end)

--script.on_event(defines.events.on_gui_click, gui_click.onClick)

-- ontick hooks
script.on_event(defines.events.on_tick, function(event)
	if event.tick%(60*60)==1 and global.dyworld.Players ~= 0 then
		if global.dyworld.RPG_Mode == "normal" then
			GlobalSkillsReset()
			for k,v in pairs(global.players) do
				if v.Alive and v.Playing then
					BodySkills(v.PlayerID)
					GlobalSkills(v.PlayerID)
				end
			end
		end
	end
	if event.tick%(60*60*1)==1 and global.dyworld.Players ~= 0 then
		for k,v in pairs(global.players) do
			if v.Alive and v.Playing then
				if settings.startup["DyWorld_Story"].value or settings.startup["DyWorld_Needs"].value then
					Needs_Timed(v.PlayerID)
				end
			end
		end
	end
	if event.tick%(60*5)==1 and global.dyworld.Players ~= 0 then
		for k,v in pairs(global.players) do
			if v.Alive and v.Playing then
				if settings.startup["DyWorld_Story"].value or settings.startup["DyWorld_Needs"].value then
					if not v.State_Stats_GUI then
						local player = game.players[v.PlayerID]
						gui_4_RefreshGUI(player, v.PlayerID)
					else
						local player = game.players[v.PlayerID]
						gui_4_CloseGUI(player, v.PlayerID)
					end
				end
				--v.PosX = game.players[v.PlayerID].position.x
				--v.PosY = game.players[v.PlayerID].position.y
			end
		end
	end
	if global.dyworld.Players ~= 0 and event.tick%(15*1)==1 then --might be script heavy, but updates always instantly
		for k,v in pairs(global.players) do
			if v.Alive and v.Playing then
				v.PosX = game.players[v.PlayerID].position.x
				v.PosY = game.players[v.PlayerID].position.y
				if v.State_Distance_GUI and v.Alive and v.Playing and not v.State_Stats_GUI then
					local player = game.players[v.PlayerID]
					gui_5_RefreshGUI(player, v.PlayerID)
				end
			end
		end
	end
	if event.tick%(60*5)==1 then
		if global.dyworld.RPG_Mode == "normal" then
			for k,v in pairs(global.players) do
				if v.State_Stats_GUI and v.Alive and v.Playing then
				local player = game.players[v.PlayerID]
					gui_1_closeGUI(player, v.PlayerID)
					gui_1_openGui(player, v.PlayerID)
				end
			end
		end
	end
end)

-- keybinding hooks
script.on_event("DyWorld_Stats", function(event)
	if global.dyworld.RPG_Mode == "normal" then
		local player = game.players[event.player_index]
		gui_1_closeGUI(player, event.player_index)
		if global.players[event.player_index].State_Distance_GUI then
			global.players[event.player_index].State_Distance_GUI = false
			gui_5_CloseGUI(player, event.player_index)
		end
		if global.players[event.player_index].State_Stats_GUI then
			global.players[event.player_index].State_Stats_GUI = false
			gui_1_closeGUI(player, event.player_index)
		else
			global.players[event.player_index].State_Stats_GUI = true
			gui_1_openGui(player, event.player_index)
			gui_4_CloseGUI(player, event.player_index)
		end
	end
end)
script.on_event("DyWorld_Distance", function(event)
	if global.dyworld.RPG_Mode == "normal" then
		local player = game.players[event.player_index]
		if global.players[event.player_index].State_Stats_GUI then
			global.players[event.player_index].State_Stats_GUI = false
			gui_1_closeGUI(player, event.player_index)
		end
		if global.players[event.player_index].State_Distance_GUI then
			global.players[event.player_index].State_Distance_GUI = false
			gui_5_CloseGUI(player, event.player_index)
		else
			global.players[event.player_index].State_Distance_GUI = true
			gui_5_RefreshGUI(player, event.player_index)
		end
	end
end)
script.on_event("DyWorld_RoadMap", function(event)
	if global.dyworld.RPG_Mode == "normal" then
		local player = game.players[event.player_index]
		gui_3_toggleGui(player)
	end
end)
script.on_event("DyWorld_Skills", function(event)
	if global.dyworld.RPG_Mode == "normal" then
		local player = game.players[event.player_index]
		gui_2_toggleGui(player)
		BodySkills(event.player_index)
	end
end)
script.on_event("DyWorld_Guide", function(event)
	if global.dyworld.RPG_Mode == "normal" then
		local player = game.players[event.player_index]
		gui_6_toggleGui(player)
	end
end)

script.on_event("DyWorld_Debug", function(event)
	if settings.startup["DyWorld_Debug"].value or game.players[event.player_index].name == "Dysoch" then
		local player = game.players[event.player_index]
		gui_0_toggleGui(player, event.player_index)
	end
end)
script.on_event("DyWorld_Debug_LOG", function(event)
	if settings.startup["DyWorld_Debug"].value or game.players[event.player_index].name == "Dysoch" then
		local player = game.players[event.player_index]
		global.DyWorld_Debug = {}
		global.DyWorld_Debug.Tech = {}
		for _, v in pairs(game.forces.player.technologies) do
			table.insert(global.DyWorld_Debug.Tech,v.name)
			game.write_file("DyWorld/Debug/Techs.txt", v.name.."\n", true, event.player_index)
		end
		--game.write_file("DyWorld/Debug/Techs.txt", tostring(global.DyWorld_Debug.Tech))
	end
end)

script.on_event("DyWorld_rotate_inserter_pickup", function(event)
local selection = game.players[event.player_index].selected
	if selection and (selection.type == "inserter" or (selection.type == "entity-ghost" and election.ghost_type == "inserter")) then
		RotatePickup(selection, true)
	end
end)

script.on_event("DyWorld_reverse_rotate_inserter_pickup", function(event)
local selection = game.players[event.player_index].selected
	if selection and (selection.type == "inserter" or (selection.type == "entity-ghost" and selection.ghost_type == "inserter")) then
		RotatePickup(selection, false)
	end
end)

script.on_event("DyWorld_inserter_drop_distance_toggle", function(event)
local selection = game.players[event.player_index].selected
	if selection and (selection.type == "inserter" or (selection.type == "entity-ghost" and selection.ghost_type == "inserter")) then
		ToggleDropDistance(selection, event)
	end
end)

script.on_event("DyWorld_inserter_drop_lateral_adjust", function(event)
local selection = game.players[event.player_index].selected
	if selection and (selection.type == "inserter" or (selection.type == "entity-ghost" and selection.ghost_type == "inserter")) then
		LateralDropAdjust(selection)
	end
end)

--remote calls
remote.add_interface("DyWorld",
{  
	Debug_Items = function()
		Debug_Items()
	end,
	
	Change_RPG_System = function(NAME)
		global.RPG = NAME
	end,
	
	--@todo Add debug RPG elements to beta version
	RPG_Level_Increase = function(ID, AMOUNT)
		global.players[ID].Level = global.players[ID].Level + AMOUNT
		
	end,
	
	Chart = function(AMOUNT)
		game.forces.player.chart(game.player.surface, {lefttop = {x = -AMOUNT, y = -AMOUNT}, rightbottom = {x = AMOUNT, y = AMOUNT}})
	end,
	
	RegenerateOresAll = function()
		game.regenerate_entity("chalcopyrite")
		game.regenerate_entity("hematite")
		game.regenerate_entity("galena")
		game.regenerate_entity("prolycotherium")
		game.regenerate_entity("carbolycite")
		game.regenerate_entity("bauxite")
		game.regenerate_entity("radicium")
	end,
	
	RegenerateOre = function(NAME)
		game.regenerate_entity(NAME)
	end,
})

--commands.add_command("dyworld-debug-items", "Debug time :) (only for player 1!)", Debug_Items())