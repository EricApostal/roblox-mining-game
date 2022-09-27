ReplicatedStorage = game:GetService("ReplicatedStorage")
gem_config = require(game.ServerScriptService.config.gemconfig)

local coal = {}
coal['name'] = 'coal'
coal['icon_path'] = game.ReplicatedStorage.images.coal
coal['workspace_path'] = game.Workspace.coalstash.ClickDetector
coal['spawn_part'] = game.Workspace.coalisland.coalspawn
coal['gold_conversion_value'] = 1
coal['advance_prompt'] = game.Workspace.coalisland.leave_coal.ProximityPrompt
coal['advance_requirement'] = 500 -- how much gold it takes to leave this island

local iron = {}
iron['name'] = 'iron'
iron['icon_path'] = game.ReplicatedStorage.images.iron
iron['workspace_path'] = game.Workspace.ironstash.ClickDetector
iron['spawn_part'] = game.Workspace.ironisland.ironspawn
iron['gold_conversion_value'] = 3
iron['advance_prompt'] = game.Workspace.ironisland.leave_iron.ProximityPrompt
iron['advance_requirement'] = 1000

local gold = {}
gold['name'] = 'gold'
gold['icon_path'] = game.ReplicatedStorage.images.gold
gold['workspace_path'] = game.Workspace.goldstash.ClickDetector
gold['spawn_part'] = game.Workspace.goldisland.goldspawn
gold['gold_conversion_value'] = 7
gold['advance_prompt'] = game.Workspace.goldisland.leave_gold.ProximityPrompt
gold['advance_requirement'] = 20000

local diamond = {}
diamond['name'] = 'diamond'
diamond['icon_path'] = game.ReplicatedStorage.images.diamond
diamond['workspace_path'] = game.Workspace.diamondstash.ClickDetector
diamond['spawn_part'] = game.Workspace.diamondisland.diamondspawn
diamond['gold_conversion_value'] = 10
diamond['advance_prompt'] = game.Workspace.diamondisland.leave_diamond.ProximityPrompt
diamond['advance_requirement'] = 20000

gem_config.register_gems({coal, iron, gold, diamond})
