﻿-- ToME - Tales of Maj'Eyal
-- Copyright (C) 2009, 2010, 2011, 2012 Nicolas Casalini
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--
-- Nicolas Casalini "DarkGod"
-- darkgod@te4.org

local Talents = require "engine.interface.ActorTalents"

newEntity{
	define_as = "BASE_GLOVES",
	slot = "HANDS",
	type = "armor", subtype="hands",
	add_name = " (#ARMOR#)",
	display = "[", color=colors.UMBER,
	image = resolvers.image_material("gloves", "leather"),
	moddable_tile = resolvers.moddable_tile("gloves"),
	encumber = 1,
	rarity = 9,
	desc = [[손가락의 움직임을 방해하지 않으면서도 손을 어느정도 보호할 수 있는, 가벼운 장갑입니다.]],
	randart_able = "/data/general/objects/random-artifacts/gloves.lua",
	egos = "/data/general/objects/egos/gloves.lua", egos_chance = { prefix=resolvers.mbonus(40, 5), suffix=resolvers.mbonus(40, 5) },
}

newEntity{ base = "BASE_GLOVES",
	name = "rough leather gloves", short_name = "rough",
	kr_display_name = "거친가죽 장갑",
	level_range = {1, 20},
	cost = 5,
	material_level = 1,
	wielder = {
		combat_armor = 1,
		combat = {
			dam = resolvers.rngavg(5, 8),
			apr = 1,
			physcrit = 1,
			physspeed = 0,
			dammod = {dex=0.4, str=-0.6, cun=0.4 },
		},
	},
}

newEntity{ base = "BASE_GLOVES",
	name = "hardened leather gloves", short_name = "hardened",
	kr_display_name = "경화가죽 장갑",
	level_range = {20, 40},
	cost = 7,
	material_level = 3,
	wielder = {
		combat_armor = 2,
		combat = {
			dam = resolvers.rngavg(14, 18),
			apr = 3,
			physcrit = 3,
			physspeed = 0,
			dammod = {dex=0.4, str=-0.6, cun=0.4 },
		},
	},
}

newEntity{ base = "BASE_GLOVES",
	name = "drakeskin leather gloves", short_name = "drakeskin",
	kr_display_name = "용가죽 장갑",
	level_range = {40, 50},
	cost = 10,
	material_level = 5,
	wielder = {
		combat_armor = 3,
		combat = {
			dam = resolvers.rngavg(23, 28),
			apr = 5,
			physcrit = 5,
			physspeed = 0,
			dammod = {dex=0.4, str=-0.6, cun=0.4 },
		},
	},
}
