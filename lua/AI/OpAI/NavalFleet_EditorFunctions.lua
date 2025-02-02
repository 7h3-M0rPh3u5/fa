--****************************************************************************
--**
--**  File     :  /lua/ai/OpAI/NavalFleet_EditorFunctions
--**  Author(s): Dru Staltman
--**
--**  Summary  : Generic AI Platoon Build Conditions
--**             Build conditions always return true or false
--**
--**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
--****************************************************************************
local AIUtils = import('/lua/ai/aiutilities.lua')
local ScenarioFramework = import('/lua/scenarioframework.lua')
local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local ScenarioPlatoonAI = import('/lua/ScenarioPlatoonAI.lua')



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- function: NavalFleetChildCountDifficulty = BuildCondition   doc = "Please work function docs."
-- 
-- parameter 0: string   aiBrain     = "default_brain"       
-- parameter 1: string   master     = "default_master"
-- 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function NavalFleetChildCountDifficulty(aiBrain, master)
    local fleetCounter = ScenarioFramework.AMPlatoonCounter(aiBrain, master..'_FleetChildren')
    local fleetNum = ScenarioInfo.OSPlatoonCounter[master..'_FleetChildren_D'..ScenarioInfo.Options.Difficulty]
    
    if not fleetNum then
        if ScenarioInfo.Options.Difficulty == 1 then
            fleetNum = 1
        else
            --for now, always 1. left struture in case we want more later
            fleetNum = 1
        end
    end
    
    if fleetCounter < fleetNum then
        return true
    else
        return false 
    end
end       
   

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- function: NavalSubChildCountDifficulty = BuildCondition   doc = "Please work function docs."
-- 
-- parameter 0: string   aiBrain     = "default_brain"       
-- parameter 1: string   master     = "default_master"
-- 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function NavalSubChildCountDifficulty(aiBrain, master)
    local subsCounter = ScenarioFramework.AMPlatoonCounter(aiBrain, master..'_SubsChildren')
    local subsNum = ScenarioInfo.OSPlatoonCounter[master..'_SubsChildren_D'..ScenarioInfo.Options.Difficulty]
    
    if not subsNum then
        if ScenarioInfo.Options.Difficulty == 1 then
            --each is 1 per factory, up to 6
            subsNum = 1
        elseif ScenarioInfo.Options.Difficulty == 2 then
            subsNum = 2
        else
            subsNum = 3
        end
    end
        
    if subsCounter < subsNum then
        return true
    else
        return false 
    end
end       
   

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- function: NavalFleetMasterCountDifficulty = BuildCondition   doc = "Please work function docs."
-- 
-- parameter 0: string   aiBrain     = "default_brain"       
-- parameter 1: string   master     = "default_master"
-- 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function NavalFleetMasterCountDifficulty(aiBrain, master)
    local subsCounter = ScenarioFramework.AMPlatoonCounter(aiBrain, master..'_SubsChildren')
    local subsNum = ScenarioInfo.OSPlatoonCounter[master..'_SubsChildren_D'..ScenarioInfo.Options.Difficulty]
    local fleetCounter = ScenarioFramework.AMPlatoonCounter(aiBrain, master..'_FleetChildren')
    local fleetNum = ScenarioInfo.OSPlatoonCounter[master..'_FleetChildren_D'..ScenarioInfo.Options.Difficulty]
    if not fleetNum then
        if ScenarioInfo.Options.Difficulty == 1 then
            fleetNum = 1
        else
            --for now, always 1. left struture in case we want more later
            fleetNum = 1
        end
    end
    if not subsNum then
        if ScenarioInfo.Options.Difficulty == 1 then
            --each is 1 per factory, up to 6
            subsNum = 1
        elseif ScenarioInfo.Options.Difficulty == 2 then
            subsNum = 2
        else
            subsNum = 3
        end
    end

    if fleetCounter >= fleetNum and subsCounter >= subsNum then
        return true
    else
        return false        
    end
end