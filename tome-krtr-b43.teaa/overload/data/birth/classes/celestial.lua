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

newBirthDescriptor{
	type = "class",
	name = "Celestial",
	kr_display_name = "천공의 사도 (Celestial)",
	locked = function() return profile.mod.allow_build.divine end,
	locked_desc = "해와 별과 달 같은 천체를 다루는 마법은 극히 일부분의 지식만이 동쪽 대륙으로 전해졌고, 에이알에서는 잊혀졌습니다.",
	desc = {
		"천공의 사도들은 천공의 힘을 다루는 마법을 사용합니다.",
		"그들은 해와 별과 달같은 천체로부터 힘을 끌어냅니다.",
	},
	descriptor_choices =
	{
		subclass =
		{
			__ALL__ = "disallow",
			['Sun Paladin'] = "allow-nochange",
			Anorithil = "allow-nochange",
		},
	},
	copy = {
		class_start_check = function(self)
			if self.descriptor.world == "Maj'Eyal" and (self.descriptor.race == "Human" or self.descriptor.race == "Elf") then
				self.celestial_race_start_quest = self.starting_quest
				self.default_wilderness = {"zone-pop", "ruined-gates-of-morning"}
				self.starting_zone = "town-gates-of-morning"
				self.starting_quest = "start-sunwall"
				self.starting_intro = "sunwall"
				self.faction = "sunwall"
			end
		end,
	},
}

newBirthDescriptor{
	type = "subclass",
	name = "Sun Paladin",
	kr_display_name = "태양의 기사 (Sun Paladin)",
	locked = function() return profile.mod.allow_build.divine_sun_paladin end,
	locked_desc = "태양은 영광으로 가득 찬 동녘에서 떠오르나, 어둠에 둘러싸여 있을 때에도 갈구해야 하리.",
	desc = {
		"태양의 기사는 극동 지역 자유민의 최후의 보루인, '아침의 문(Gates of Morning)' 출신입니다.",
		"그들의 행동양식은 '태양은 우리의 힘이요, 순수이자, 정수니, 우리는 어두운 곳에 빛을 가져오며 누구도 우리를 쓰러뜨리지 못하리라.'라는 좌우명에 잘 드러나 있습니다.",
		"태양의 담(Sunwall)을 파괴하려는 자는, 어느 누구라도 그들이 사용하는 태양의 힘을 맛보게 될 것입니다.",
		"무기와 방패를 사용하는 전투법과 마법에 숙달되었기에, 멀리 있는 적은 불사르고 가까이 온 적은 근접전으로 제압합니다.",
		"가장 중요한 능력치는 힘과 마법입니다.",
		"#GOLD#능력치 변경:",
		"#LIGHT_BLUE# * 힘+5, 민첩+0, 체격+0",
		"#LIGHT_BLUE# * 마법+4, 의지+0, 교활함+0",
		"#GOLD#레벨 당 생명력:#LIGHT_BLUE# +2",
	},
	power_source = {technique=true, arcane=true},
	stats = { mag=4, str=5, },
	talents_types = {
		["technique/shield-offense"]={true, 0.1},
		["technique/combat-techniques-active"]={false, 0.1},
		["technique/combat-techniques-passive"]={true, 0.1},
		["technique/combat-training"]={true, 0.1},
		["cunning/survival"]={false, 0.1},
		["celestial/sun"]={true, 0},
		["celestial/chants"]={true, 0.3},
		["celestial/combat"]={true, 0.3},
		["celestial/light"]={true, 0.3},
		["celestial/guardian"]={false, 0.3},
	},
	birth_example_particles = "golden_shield",
	talents = {
		[ActorTalents.T_SEARING_LIGHT] = 1,
		[ActorTalents.T_WEAPON_OF_LIGHT] = 1,
		[ActorTalents.T_CHANT_OF_FORTITUDE] = 1,
		[ActorTalents.T_ARMOUR_TRAINING] = 3,
	},
	copy = {
		max_life = 110,
		resolvers.equip{ id=true,
			{type="weapon", subtype="mace", name="iron mace", ingore_material_restriction=true, autoreq=true, ego_chance=-1000},
			{type="armor", subtype="shield", name="iron shield", ingore_material_restriction=true, autoreq=true, ego_chance=-1000},
			{type="armor", subtype="heavy", name="iron mail armour", ingore_material_restriction=true, autoreq=true, ego_chance=-1000},
		},
	},
	copy_add = {
		life_rating = 2,
	},
}

newBirthDescriptor{
	type = "subclass",
	name = "Anorithil",
	kr_display_name = "아노리실 (Anorithil)",
	locked = function() return profile.mod.allow_build.divine_anorithil end,
	locked_desc = "천체의 힘을 조율하는 것은 경외스런 일이다. 빛과 어둠을 뜻대로 다루며 황혼에 거하는 자들은 강대하다.",
	desc = {
		"아노리실은 극동 지역 자유민의 최후의 보루인, '아침의 문(Gates of Morning)' 출신입니다.",
		"그들의 행동양식은 '우리는 빛과 어둠이 마주하는, 태양과 달 사이에 서 있다. 황혼의 어스름 속에서 우리의 운명을 찾으리라.'라는 좌우명에 잘 드러나 있습니다.",
		"태양의 담(Sunwall)을 파괴하려는 자는, 어느 누구라도 그들이 사용하는 태양과 달의 힘에 불살라지고 찢겨질 것입니다.",
		"태양의 마법과 달의 마법 모두에 능통하기에, 적을 태양광으로 불사른 뒤 별의 분노를 퍼붓는 식으로 싸웁니다.",
		"가장 중요한 능력치는 마법과 교활함입니다.",
		"#GOLD#능력치 변경:",
		"#LIGHT_BLUE# * 힘+0, 민첩+0, 체격+0",
		"#LIGHT_BLUE# * 마법+6, 의지+0, 교활함+3",
		"#GOLD#레벨 당 생명력:#LIGHT_BLUE# +0",
	},
	power_source = {arcane=true},
	stats = { mag=6, cun=3, },
	talents_types = {
		["cunning/survival"]={false, 0.1},
		["celestial/sun"]={true, 0.3},
		["celestial/chants"]={true, 0.3},
		["celestial/glyphs"]={false, 0.3},
		["celestial/circles"]={false, 0.3},
		["celestial/eclipse"]={true, 0.3},
		["celestial/light"]={true, 0.3},
		["celestial/twilight"]={true, 0.3},
		["celestial/hymns"]={true, 0.3},
		["celestial/star-fury"]={true, 0.3},
	},
	birth_example_particles = "darkness_shield",
	talents = {
		[ActorTalents.T_SEARING_LIGHT] = 1,
		[ActorTalents.T_MOONLIGHT_RAY] = 1,
		[ActorTalents.T_HYMN_OF_SHADOWS] = 1,
		[ActorTalents.T_TWILIGHT] = 1,
	},
	copy = {
		max_life = 90,
		resolvers.equip{ id=true,
			{type="weapon", subtype="staff", name="elm staff", ingore_material_restriction=true, autoreq=true, ego_chance=-1000},
			{type="armor", subtype="cloth", name="linen robe", ingore_material_restriction=true, autoreq=true, ego_chance=-1000}
		},
	},
}