--****************************************************************************
--**
--**  File     :  /cdimage/units/UEA0101/UEA0101_script.lua
--**  Author(s):  John Comes, David Tomandl
--**
--**  Summary  :  UEF Scout Script
--**
--**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
--****************************************************************************

local TAirUnit = import('/lua/terranunits.lua').TAirUnit

UEA0101 = Class(TAirUnit) {
    DestructionPartsLowToss = {'UEA0101'},
    DestroySeconds = 7.5,
}

TypeClass = UEA0101