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

local Map = require "engine.Map"

newTalent{
	name = "Lacerating Strikes",
	kr_display_name = "찢기 공격",
	type = {"cunning/scoundrel", 1},
	mode = "passive",
	points = 5,
	require = cuns_req1,
	mode = "passive",
	do_cut = function(self, t, target, dam)
		if target:canBe("cut") and rng.percent(10+(self:getTalentLevel(t)*10)) then
			dam = dam * self:combatTalentWeaponDamage(t, 0.15, 0.35)
			target:setEffect(target.EFF_CUT, 10, {src=self, power=(dam / 10)})
		end
	end,
	info = function(self, t)
		return ([[적을 공격할 때마다 찢어버려, %d%% 확률로 적에게 가한 피해량의 %d%% 에 해당하는 출혈 피해를 10 턴에 걸쳐 추가로 줍니다.]]):
		format(10+(self:getTalentLevel(t)*10),100 * self:combatTalentWeaponDamage(t, 0.15, 0.35))
	end,
}

newTalent{
	name = "Scoundrel's Strategies", short_name = "SCOUNDREL",
	kr_display_name = "무뢰배의 전략",
	type = {"cunning/scoundrel", 2},
	require = cuns_req2,
	mode = "passive",
	points = 5,
	getDuration = function(self, t) return 3 + math.ceil(self:getTalentLevel(t)/2) end,
	getMovePenalty = function(self, t) return (5 + self:combatTalentStatDamage(t, "cun", 10, 30)) / 100 end,
	getAttackPenalty = function(self, t) return 5 + self:combatTalentStatDamage(t, "cun", 5, 20) end,
	getWillPenalty = function(self, t) return 5 + self:combatTalentStatDamage(t, "cun", 5, 20) end,
	getCunPenalty = function(self, t) return 5 + self:combatTalentStatDamage(t, "cun", 5, 20) end,
	do_scoundrel = function(self, t, target)
		if not rng.percent(5+(self:getTalentLevel(t)*3)) then return end
		if rng.percent(50) then
			if target:hasEffect(target.EFF_DISABLE) then return end
			target:setEffect(target.EFF_DISABLE, t.getDuration(self, t), {speed=t.getMovePenalty(self, t), atk=t.getAttackPenalty(self, t), apply_power=self:combatAttack()})
		else
			if target:hasEffect(target.EFF_ANGUISH) then return end
			target:setEffect(target.EFF_ANGUISH, t.getDuration(self, t), {will=t.getWillPenalty(self, t), cun=t.getCunPenalty(self, t), apply_power=self:combatAttack()})
		end
	end,
	info = function(self, t)
		local duration = t.getDuration(self, t)
		local move = t.getMovePenalty(self, t)
		local attack = t.getAttackPenalty(self, t)
		local will = t.getWillPenalty(self, t)
		local cun = t.getCunPenalty(self, t)
		return ([[적의 고통을 이용하는 법을 배웁니다.
		출혈 상태의 적이 자신을 공격할 때, 상처로 인해 적의 치명타율이 %d%% 감소하게 됩니다.
		그리고 자신이 출혈 상태의 적을 공격할 때 %d%% 확률로 %d 턴 동안, 몸을 가누지 못하게 되거나 (이동 속도 %d%% 감소, 정확도 %d 감소) 고통의 비명을 지르게 만듭니다. (의지 능력치 %d 감소, 교활함 능력치 %d 감소)
		기술의 효과는 교활함 능력치의 영향을 받아 증가합니다.]]):format(5+(self:getTalentLevel(t)*5),5+(self:getTalentLevel(t)*3),duration,move * 100,attack,will,cun)
	end,
}

newTalent{
	name = "Nimble Movements",
	kr_display_name = "재빠른 이동",
	type = {"cunning/scoundrel",3},
	message = "@Source1@ 빠르게 이동합니다!",
	no_break_stealth = true,
	require = cuns_req3,
	points = 5,
	random_ego = "attack",
	cooldown = function(self, t) return math.floor(35 - self:getTalentLevel(t) * 3.5) end,
	tactical = { CLOSEIN = 3 },
	requires_target = true,
	range = function(self, t) return math.floor(6 + self:getTalentLevel(t) * 0.6) end,
	action = function(self, t)
		if self:attr("never_move") then game.logPlayer(self, "지금은 그 기술을 사용할 수 없습니다.") return end

		local tg = {type="hit", range=self:getTalentRange(t)}
		local x, y, target = self:getTarget(tg)
		if not x or not y then return nil end
		if core.fov.distance(self.x, self.y, x, y) > self:getTalentRange(t) then return nil end

		local block_actor = function(_, bx, by) return game.level.map:checkEntity(bx, by, Map.TERRAIN, "block_move", self) end
		local l = self:lineFOV(x, y, block_actor)
		local lx, ly, is_corner_blocked = l:step()
		if is_corner_blocked or game.level.map:checkAllEntities(lx, ly, "block_move", self) then
			game.logPlayer(self, "그것을 통과하여 달릴 수 없습니다!")
			return
		end
		local tx, ty = lx, ly
		lx, ly, is_corner_blocked = l:step()
		while lx and ly do
			if is_corner_blocked or game.level.map:checkAllEntities(lx, ly, "block_move", self) then break end
			tx, ty = lx, ly
			lx, ly, is_corner_blocked = l:step()
		end

		local ox, oy = self.x, self.y
		self:move(tx, ty, true)
		if config.settings.tome.smooth_move > 0 then
			self:resetMoveAnim()
			self:setMoveAnim(ox, oy, 8, 5)
		end

		return true
	end,
	info = function(self, t)
		return ([[목표 지점으로 조용하고 빠르게 달려갑니다. 이동 중에 적이나 장애물에 부딪히지 않는 한, 은신 상태는 해제되지 않습니다.]])
	end,
}


newTalent{
	name = "Misdirection",
	kr_display_name = "착각 유발",
	type = {"cunning/scoundrel", 4},
	mode = "passive",
	points = 5,
	require = cuns_req4,
	mode = "passive",
	on_learn = function(self, t)
		self.projectile_evasion = (self.projectile_evasion or 0) + 3
		self.projectile_evasion_spread = (self.projectile_evasion_spread or 0) + 1
	end,
	on_unlearn = function(self, t)
		self.projectile_evasion = (self.projectile_evasion or 0) - 3
		self.projectile_evasion_spread = (self.projectile_evasion_spread or 0) - 1
	end,
	-- Talking with SageAcrin, this is definitely an accurate portrayal of the skill's effects. 
	info = function(self, t)
		return ([[아주 단순한 움직임만 가지고도 적들을 당황하게 만들어, 적들이 공격 중에 실수를 더 자주 하게 됩니다.
		회피도가 %d%% 상승하며, %d%% 확률로 적의 공격이 실패하여 주변 %d 칸 반경의 무작위한 곳에 공격을 하게 됩니다.
		회피도 상승량은 교활함 능력치의 영향을 받아 증가합니다.]]):
		format(self:getTalentLevel(self.T_MISDIRECTION) * (0.02 * (1 + self:getCun() / 85) *100), self:getTalentLevelRaw(t) * 3, self:getTalentLevelRaw(t) * 1)
	end,
}