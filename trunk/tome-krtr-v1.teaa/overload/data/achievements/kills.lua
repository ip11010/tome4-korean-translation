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

newAchievement{
	name = "That was close",
	kr_display_name = "십년 감수",
	show = "full",
	desc = [[생명력이 1 만 남은 상태로 적을 죽임.]],
}
newAchievement{
	name = "Size matters",
	kr_display_name = "크기의 문제",
	show = "full",
	desc = [[한 번의 공격으로 600 이상의 피해를 줌.]],
	on_gain = function(_, src, personal)
		if src.descriptor and (src.descriptor.subclass == "Rogue" or src.descriptor.subclass == "Shadowblade") then
			game:setAllowedBuild("rogue_marauder", true)
		end
	end,
}
newAchievement{
	name = "Size is everything", id = "DAMAGE_1500",
	kr_display_name = "크기가 전부야",
	show = "full",
	desc = [[한 번의 공격으로 1500 이상의 피해를 줌.]],
}
newAchievement{
	name = "The bigger the better!", id = "DAMAGE_3000",
	kr_display_name = "크면 클수록 더 좋지!",
	show = "full",
	desc = [[한 번의 공격으로 3000 이상의 피해를 줌.]],
}
newAchievement{
	name = "Overpowered!", id = "DAMAGE_6000",
	kr_display_name = "압도!",
	show = "full",
	desc = [[한 번의 공격으로 6000 이상의 피해를 줌.]],
}
newAchievement{
	name = "Exterminator",
	kr_display_name = "절멸자",
	show = "full",
	desc = [[1000명의 생명체 살해.]],
	mode = "player",
	can_gain = function(self, who)
		self.nb = (self.nb or 0) + 1
		if self.nb >= 1000 then return true end
	end,
	track = function(self) return tstring{tostring(self.nb or 0)," / 1000"} end,
}
newAchievement{
	name = "Pest Control",
	kr_display_name = "해충 구제",
	image = "npc/vermin_worms_green_worm_mass.png",
	show = "full",
	desc = [[1000 마리의 번식형 해충 살해.]],
	mode = "player",
	can_gain = function(self, who, target)
		if target:knowTalent(target.T_MULTIPLY) or target.clone_on_hit then
			self.nb = (self.nb or 0) + 1
			if self.nb >= 1000 then return true end
		end
	end,
	track = function(self) return tstring{tostring(self.nb or 0)," / 1000"} end,
}
newAchievement{
	name = "Reaver",
	kr_display_name = "파괴자",
	show = "full",
	desc = [[1000명의 영장류 살해.]],
	mode = "world",
	can_gain = function(self, who, target)
		if target.type == "humanoid" then
			self.nb = (self.nb or 0) + 1
			if self.nb >= 1000 then return true end
		end
	end,
	track = function(self) return tstring{tostring(self.nb or 0)," / 1000"} end,
	on_gain = function(_, src, personal)
		game:setAllowedBuild("corrupter")
		game:setAllowedBuild("corrupter_reaver", true)
	end,
}

newAchievement{
	name = "Backstabbing Traitor", id = "ESCORT_KILL",
	kr_display_name = "중상모략적인 배반자",
	image = "object/knife_stralite.png",
	show = "full",
	desc = [[Killed 6 escorted adventurers while you were supposed to save them.]],
	mode = "player",
	can_gain = function(self, who, target)
		self.nb = (self.nb or 0) + 1
		if self.nb >= 6 then return true end
	end,
	track = function(self) return tstring{tostring(self.nb or 0)," / 6"} end,
}

newAchievement{
	name = "Bad Driver", id = "ESCORT_LOST",
	kr_display_name = "나쁜 길잡이",
	show = "full",
	desc = [[Failed to save any escorted adventurers.]],
	mode = "player",
	can_gain = function(self, who, target)
		self.nb = (self.nb or 0) + 1
		if self.nb >= 9 then return true end
	end,
	track = function(self) return tstring{tostring(self.nb or 0)," / 9"} end,
}

newAchievement{
	name = "Guiding Hand", id = "ESCORT_SAVED",
	kr_display_name = "인도의 손길",
	show = "full",
	desc = [[Saved all escorted adventurers.]],
	mode = "player",
	can_gain = function(self, who, target)
		self.nb = (self.nb or 0) + 1
		if self.nb >= 9 then return true end
	end,
	track = function(self) return tstring{tostring(self.nb or 0)," / 9"} end,
}

newAchievement{
	name = "Earth Master", id = "GEOMANCER",
	kr_display_name = "대지의 명인",
	show = "name",
	desc = [[Killed Harkor'Zun and unlocked Stone magic.]],
	mode = "player",
}

newAchievement{
	name = "Kill Bill!", id = "KILL_BILL",
	kr_display_name = "킬 빌!",
	image = "object/artifact/bill_treestump.png",
	show = "full",
	desc = [[Killed Bill in the Trollmire with a level one character.]],
	mode = "player",
}

newAchievement{
	name = "Atamathoned!", id = "ATAMATHON",
	kr_display_name = "아타마쏜!",
	image = "npc/atamathon.png",
	show = "name",
	desc = [[Killed the giant golem Atamathon after foolishly reactivating it.]],
	mode = "player",
}

newAchievement{
	name = "Huge Appetite", id = "EAT_BOSSES",
	kr_display_name = "거대한 식욕",
	show = "full",
	desc = [[Ate 20 bosses.]],
	mode = "player",
	can_gain = function(self, who, target)
		if target.rank < 3.5 then return false end
		self.nb = (self.nb or 0) + 1
		if self.nb >= 20 then return true end
	end,
	track = function(self) return tstring{tostring(self.nb or 0)," / 20"} end,
}

newAchievement{
	name = "Headbanger", id = "HEADBANG",
	kr_display_name = "헤드뱅어",
	show = "full",
	desc = [[Headbanged 20 bosses to death.]],
	mode = "player",
	can_gain = function(self, who, target)
		if target.rank < 3.5 then return false end
		self.nb = (self.nb or 0) + 1
		if self.nb >= 20 then return true end
	end,
	track = function(self) return tstring{tostring(self.nb or 0)," / 20"} end,
}

newAchievement{
	name = "Are you out of your mind?!", id = "UBER_WYRMS_OPEN",
	kr_display_name = "너 지금 정신 나갔냐?!",
	image = "npc/dragon_multihued_multi_hued_drake.png",
	show = "name",
	desc = [[Caught the attention of overpowered greater multi-hued wyrms in Vor Armoury. Perhaps fleeing is in order.]],
	mode = "player",
}

newAchievement{
	name = "I cleared the room of death and all I got was this lousy achievement!", id = "UBER_WYRMS",
	kr_display_name = "죽음의 방을 싹쓸어도, 얻은 건 이 시끄러운 업적 뿐이야!",
	image = "npc/dragon_multihued_multi_hued_drake.png",
	show = "name",
	desc = [[Killed the seven overpowered wyrms in the "Room of Death" in Vor Armoury.]],
	mode = "player",
	can_gain = function(self, who)
		self.nb = (self.nb or 0) + 1
		if self.nb >= 7 then return true end
	end,
}

newAchievement{
	name = "I'm a cool hero", id = "NO_DERTH_DEATH",
	kr_display_name = "나는 멋진 영웅이지",
	image = "npc/humanoid_human_human_farmer.png",
	show = "name",
	desc = [[Saved Derth without a single inhabitant dying.]],
	mode = "player",
}

newAchievement{
	name = "Kickin' it old-school", id = "FIRST_BOSS_URKIS",
	kr_display_name = "Kickin' it old-school", --@@ 여기 부터는 나중에 번역
	image = "npc/humanoid_human_urkis__the_high_tempest.png",
	show = "full",
	desc = [[Killed Urkis, the Tempest, causing him to drop the Rod of Recall.]],
	mode = "player",
}

newAchievement{
	name = "Leave the big boys alone", id = "FIRST_BOSS_MASTER",
	kr_display_name = "Leave the big boys alone",
	image = "npc/the_master.png",
	show = "full",
	desc = [[Killed The Master, causing him to drop the Rod of Recall.]],
	mode = "player",
}

newAchievement{
	name = "You know who's to blame", id = "FIRST_BOSS_GRAND_CORRUPTOR",
	kr_display_name = "You know who's to blame",
	image = "npc/humanoid_shalore_grand_corruptor.png",
	show = "full",
	desc = [[Killed the Grand Corruptor, causing him to drop the Rod of Recall.]],
	mode = "player",
}

newAchievement{
	name = "You know who's to blame (reprise)", id = "FIRST_BOSS_MYSSIL",
	kr_display_name = "You know who's to blame (reprise)",
	image = "npc/humanoid_halfling_protector_myssil.png",
	show = "full",
	desc = [[Killed Myssil, causing her to drop the Rod of Recall.]],
	mode = "player",
}
