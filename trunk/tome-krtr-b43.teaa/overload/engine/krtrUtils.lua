﻿-- ToME4 korean Translation addon
-- utility functions for korean Translation 
-- 사용하려는 파일마다 상단부에 명령 추가 필요 : require "engine.krtrUtils" 

function string.addJosa(str, temp)
	local josa1, josa2, index

	if temp == 1 or temp == "가" or temp == "이" then
		josa1 = "가"
		josa2 = "이"
		index = 1
	elseif temp == 2 or temp == "는" or temp == "은" then
		josa1 = "는"
		josa2 = "은"
		index = 2
	elseif temp == 3 or temp == "를" or temp == "을" then
		josa1 = "를"
		josa2 = "을"
		index = 3
	elseif temp == 4 or temp == "로" or temp == "으로" then
		josa1 = "로"
		josa2 = "으로"
		index = 4
	elseif temp == 5 or temp == "다" or temp == "이다" then
		josa1 = "다"
		josa2 = "이다"
		index = 5
	elseif temp == 6 or temp == "와" or temp == "과" then
		josa1 = "와"
		josa2 = "과"
		index = 6
	else
		if type(temp) == string then return str .. temp
		else return str end 
	end

	local length = str:len()
	
	if length < 3 then
		return str .. josa2
	end
	
	local c1 = str:byte(length-2)
	local c2 = str:byte(length-1)
	local c3 = str:byte(length)
	
	local last = ( (c1-234)*4096 + (c2-128)*64 + (c3-128) - 3072 )%28
	
	if last == 0 or ( index == 4 and last == 8 ) then
		return str .. josa1
	else
		return str .. josa2
	end
end

function string.krStat(engStat)
	local ori = engStat:lower()
	if ori == "strength" or ori == "str" then return "힘"
	elseif ori == "dexterity" or ori == "dex" then return "민첩"
	elseif ori == "constitution" or ori == "con" then return "체격"
	elseif ori == "magic" or ori == "mag" then return "마법"
	elseif ori == "willpower" or ori == "wil" then return "의지"
	elseif ori == "cunning" then return "교활함"
	elseif ori == "cun" then return "교활"
	elseif ori == "luck" or ori == "lck" then return "행운"
	else return engStat end
end

function string.krDamageType(str)
	local ori = str:lower()
	if ori == "physical" then return "물리"
	elseif ori == "arcane" then return "마법"
	elseif ori == "fire" then return "화염"
	elseif ori == "cold" then return "추위"
	elseif ori == "lightning" then return "전기"
	elseif ori == "acid" then return "산성"
	elseif ori == "nature" then return "자연"
	elseif ori == "blight" then return "황폐"
	elseif ori == "light" then return "빛"
	elseif ori == "darkness" then return "어둠"
	elseif ori == "mind" then return "정신"
	elseif ori == "temporal" then return "시간"
	elseif ori == "lite" then return "조명"
	elseif ori == "silence" then return "침묵"
	elseif ori == "poison" then return "중독"
	elseif ori == "inferno" then return "열화"
	elseif ori == "bleed" then return "출혈"
	elseif ori == "slime" then return "슬라임"
	elseif ori == "dig" then return "굴착"
	elseif ori == "slow" then return "감속"
	elseif ori == "confusion" then return "혼돈"
	elseif ori == "sand" then return "수면"
	elseif ori == "pinning" then return "속박"
	elseif ori == "blindness" then return "실명"
	elseif ori == "ice" then return "냉동"
	elseif ori == "freeze" then return "빙결"
	elseif ori == "healing" then return "회복"
	elseif ori == "matter" then return "물질"
	elseif ori == "void" then return "공허"
	elseif ori == "gravity" then return "중력"
	elseif ori == "temporalstun" then return "시간적 기절"
	elseif ori == "break stealth" then return "은신해제"
	elseif ori == "arcane silence" then return "마법적 침묵"
	elseif ori == "% chance to silence target" then return "% 확률적 침묵"
	elseif ori == "blinding ink" then return "눈가리기"
	elseif ori == "bright light" then return "빛의 조명"
	elseif ori == "fire burn" then return "지속형 화염"
	elseif ori == "fireburn" then return "지속형 화염"
	elseif ori == "shadowflame" then return "어두운 화염"
	elseif ori == "darkstun" then return "암흑의 기절"
	elseif ori == "minions darkness" then return "어둠의 소환수"
	elseif ori == "firey no friends" then return "화염"
	elseif ori == "coldstun" then return "추위로 기절"
	elseif ori == "flameshock" then return "뜨거운 기절"
	elseif ori == "coldnevermove" then return "얼림"
	elseif ori == "sticky smoke" then return "끈적이는 연기"
	elseif ori == "acid blind" then return "신성 실명"
	elseif ori == "blinding darkness" then return "실명의 어둠"
	elseif ori == "lightning daze" then return "전기로 혼절"
	elseif ori == "wave" then return "파동"
	elseif ori == "fire knockback" then return "밀어내기 화염"
	elseif ori == "fire knockback mind" then return "정신적 밀어내기 화염"
	elseif ori == "darkness knockback" then return "밀어내기 어둠"
	elseif ori == "spell knockback" then return "밀어내기 주문"
	elseif ori == "mind knockback" then return "밀어내기 정신"
	elseif ori == "physknockback" then return "밀어내기 물리"
	elseif ori == "fear knockback" then return "밀어내기 공포"
	elseif ori == "spydric poison" then return "속박형 중독"
	elseif ori == "crippling poison" then return "장애형 중독"
	elseif ori == "insidious poison" then return "반회복형 중독"
	elseif ori == "physical + bleeding" then return "물리 + 출혈"
	elseif ori == "congeal time" then return "시간 멈춤"
	elseif ori == "time prison" then return "시간의 감옥"
	elseif ori == "% chances to confuse" then return "% 확률적 혼돈"
	elseif ori == "% chances to cause a gloom effect" then return "% 확률적 침울"
	elseif ori == "% chances to blind" then return "% 확률적 실명"
	elseif ori == "drain experience" then return "경험치 감소"
	elseif ori == "drain life" then return "생명력 감소"
	elseif ori == "drain vim" then return "정력 감소"
	elseif ori == "demonfire" then return "악마의 불길"
	elseif ori == "retch" then return "구역질"
	elseif ori == "holy light" then return "성스런 빛"
	elseif ori == "healing power" then return "회복력"
	elseif ori == "healing nature" then return "자연적 회복"
	elseif ori == "corrupted blood" then return "타락한 피"
	elseif ori == "blood boil" then return "끓는 피"
	elseif ori == "life leech" then return "생명력 강탈"
	elseif ori == "physical stun" then return "물리적 기절"
	elseif ori == "split bleed" then return "피 튀기기"
	elseif ori == "gravity pin" then return "중력적 속박"
	elseif ori == "repulsion" then return "혐오"
	elseif ori == "grow" then return "성장"
	elseif ori == "sanctity" then return "신성"
	elseif ori == "shiftingshadows" then return "그림자변형"
	elseif ori == "blazinglight" then return "타오르는 빛"
	elseif ori == "warding" then return "보호"
	elseif ori == "mindslow" then return "정신적 감속"
	elseif ori == "mindfreeze" then return "정신적 빙결"
	elseif ori == "implosion" then return "파열"
	elseif ori == "reverse aging" then return "젊어짐"
	elseif ori == "wasting" then return "낭비"
	elseif ori == "stop" then return "멈춤"
	elseif ori == "rethread" then return "재구축"
	elseif ori == "temporal echo" then return "시간의 메아리"
	elseif ori == "devour life" then return "생명력 먹어치우기"
	elseif ori == "chronoslow" then return "시간의 느려짐"
	elseif ori == "molten rock" then return "녹아내리는 바위"
	elseif ori == "entangle" then return "얽힘"
	elseif ori == "manaworm" then return "마나벌레"
	elseif ori == "void blast" then return "공허의 돌풍"
	elseif ori == "circle of death" then return "죽음의 고리"
	elseif ori == "rigor mortis" then return "사후 경직"
	elseif ori == "abyssal shroud" then return "심연의 덮개"
	elseif ori == "% chance to summon an orc spirit" then return "% 확률적 오크 정신체 소환"
	elseif ori == "nightmare" then return "악몽"
	elseif ori == "weakness" then return "허약"
	elseif ori == "temp effect" then return "일시적 효과"
	elseif ori == "manaburn" then return "마나태우기"
	elseif ori == "leaves" then return "나뭇잎"
	elseif ori == "distortion" then return "왜곡"
	elseif ori == "dreamforge" then return "꿈의 제조"
	elseif ori == "mucus" then return "점액"
	elseif ori == "acid disarm" then return "산성 무장해제"
	elseif ori == "corrosive acid" then return "산성 부식"
	elseif ori == "bouncing slime" then return "활발한 슬라임"
	else return str end
end

function string.krItemType(str)
	local ori = str:lower()
	if ori == "weapon" then return "무기"
	elseif ori == "armor" then return "갑옷"
	elseif ori == "tool" then return "도구"
	elseif ori == "misc" then return "기타"
	elseif ori == "gem" then return "보석"
	elseif ori == "jewelry" then return "장신구"
	elseif ori == "lite" then return "조명"
	elseif ori == "money" then return "금화"
	elseif ori == "mount" then return "탈것"
	elseif ori == "potion" then return "물약"
	elseif ori == "charm" then return "부적"
	elseif ori == "scroll" then return "마법기"
	elseif ori == "orb" then return "오브"
	elseif ori == "chest" then return "상자"
	elseif ori == "inscription" then return "각인"
	-- 위는 type, 아래는 subtype
	elseif ori == "battleaxe" then return "대형도끼"
	elseif ori == "greatmaul" then return "대형망치"
	elseif ori == "greatsword" then return "대검"
	elseif ori == "trident" then return "삼지창"
	elseif ori == "waraxe" then return "도끼"
	elseif ori == "longbow" then return "활"
	elseif ori == "cloak" then return "망토"
	elseif ori == "cloth" then return "의류"
	elseif ori == "digger" then return "곡괭이"
	elseif ori == "ingredient" then return "연금술재료"
	elseif ori == "hands" then return "장갑"
	elseif ori == "white" then return "흰색"
	elseif ori == "red" then return "붉은색"
	elseif ori == "yellow" then return "노란색"
	elseif ori == "green" then return "녹색"
	elseif ori == "blue" then return "파란색"
	elseif ori == "black" then return "검은색"
	elseif ori == "violet" then return "보라색"
	elseif ori == "heavy" then return "중갑"
	elseif ori == "feet" then return "신발"
	elseif ori == "head" then return "모자"
	elseif ori == "ring" then return "반지"
	elseif ori == "amulet" then return "목걸이"
	elseif ori == "dagger" then return "단검"
	elseif ori == "belt" then return "허리띠"
	elseif ori == "light" then return "경갑"
	elseif ori == "mace" then return "철퇴"
	elseif ori == "massive" then return "판갑"
	elseif ori == "mindstar" then return "마석"
	elseif ori == "golem" then return "골렘"
	elseif ori == "mummy" then return "미라붕대"
	elseif ori == "shield" then return "방패"
	elseif ori == "sling" then return "투석구"
	elseif ori == "staff" then return "마법지팡이"
	elseif ori == "longsword" then return "장검"
	elseif ori == "rod" then return "장대"
	elseif ori == "torque" then return "주술고리"
	elseif ori == "totem" then return "토템"
	elseif ori == "wand" then return "마법막대"
	elseif ori == "whip" then return "채찍"
	elseif ori == "infusion" then return "주입"
	elseif ori == "rune" then return "룬"
	elseif ori == "taint" then return "얼룩"
	elseif ori == "sher'tul" then return "쉐르'툴"
	elseif ori == "organic" then return "장기"
	else return str end
end


function string.krTalentType(str)
	local ori = str:lower()
	if ori == "technique" then return "물리"
	elseif ori == "celestial" then return "천공"
	elseif ori == "chronomancy" then return "시공"
	elseif ori == "corruption" then return "타락"
	elseif ori == "cunning" then return "교활"
	elseif ori == "cursed" then return "저주"
	elseif ori == "wild-gift" then return "자연의 권능"
	elseif ori == "base" then return "기본"
	elseif ori == "inscriptions" then return "각인"
	elseif ori == "race" then return "종족"
	elseif ori == "tutorial" then return "입문"
	elseif ori == "psionic" then return "초능력"
	elseif ori == "spell" then return "주문"
	elseif ori == "undead" then return "언데드"
	-- misc
	elseif ori == "class" then return "직업"
	elseif ori == "race" then return "종족"
	elseif ori == "higher" then return "하이어"
	elseif ori == "shalore" then return "샬로레"
	elseif ori == "thalore" then return "탈로레"
	elseif ori == "halfling" then return "하플링"
	elseif ori == "dwarf" then return "드워프"
	elseif ori == "ghoul" then return "구울"
	elseif ori == "skeleton" then return "스켈레톤"
	elseif ori == "yeek" then return "이크"
	elseif ori == "inscriptions" then return "각인"
	elseif ori == "infusions" then return "인퓨전"
	elseif ori == "runes" then return "룬"
	elseif ori == "taints" then return "얼룩"
	elseif ori == "horror" then return "공포"
	elseif ori == "objects" then return "물체"
	elseif ori == "other" then return "기타"
	---- celestial
	elseif ori == "guardian" then return "빛의 수호자"
	elseif ori == "chants" then return "태양의 찬가"
	elseif ori == "light" then return "빛"
	elseif ori == "combat" then return "빛의 전투"
	elseif ori == "sun" then return "태양"
	elseif ori == "glyphs" then return "문양"
	elseif ori == "twilight" then return "황혼"
	elseif ori == "star fury" then return "별의 분노"
	elseif ori == "hymns" then return "달의 송가"
	elseif ori == "circles" then return "권역"
	elseif ori == "eclipse" then return "금환식"
	-- uber
	elseif ori == "strength" then return "힘"
	elseif ori == "dexterity" then return "민첩"
	elseif ori == "constitution" then return "체격"
	elseif ori == "magic" then return "마법"
	elseif ori == "willpower" then return "의지"
	elseif ori == "cunning" then return "교활"
	-- undeads
	elseif ori == "ghoul" then return "구울"
	elseif ori == "skeleton" then return "스켈레톤"
	elseif ori == "vampire" then return "흡혈귀"
	elseif ori == "lich" then return "리치"
	-- techniques
	elseif ori == "two-handed weapons" then return "양손무기 공격기술"
	elseif ori == "two-handed maiming" then return "양손무기 제압기술"
	elseif ori == "shield offense" then return "방패 공격기술"
	elseif ori == "shield defense" then return "방패 방어기술"
	elseif ori == "dual weapons" then return "쌍수 무기 숙련"
	elseif ori == "dual techniques" then return "쌍수 무기 공격기술"
	elseif ori == "archery - base" then return "사격기술 - 기본"
	elseif ori == "archery - bows" then return "사격기술 - 활"
	elseif ori == "archery - slings" then return "사격기술 - 투석구"
	elseif ori == "archery training" then return "사격기술 숙련"
	elseif ori == "archery prowess" then return "사격기술 - 고급"
	elseif ori == "superiority" then return "전투 압도기술"
	elseif ori == "battle tactics" then return "전술 행동"
	elseif ori == "warcries" then return "전투 함성"
	elseif ori == "bloodthirst" then return "피의 갈망"
	elseif ori == "field control" then return "전장 제어"
	elseif ori == "combat techniques" then return "전투 기술"
	elseif ori == "combat veteran" then return "전투 숙련"
	elseif ori == "combat training" then return "전투장비 숙련"
	elseif ori == "magical combat" then return "마법 전투기술"
	elseif ori == "mobility" then return "기동성"
	elseif ori == "thuggery" then return "무법자의 전투기술"
	elseif ori == "pugilism" then return "권투 기술"
	elseif ori == "finishing moves" then return "마무리 공격"
	elseif ori == "grappling" then return "잡기기술"
	elseif ori == "unarmed discipline" then return "맨손전투 고급기술 "
	elseif ori == "unarmed training" then return "맨손전투 숙련"
	elseif ori == "conditioning" then return "신체 조절"
	elseif ori == "unarmed other" then return "기타 맨손 기술"
	-- chronomancy
	elseif ori == "age manipulation" then return "시간 조작"
	elseif ori == "chronomancy" then return "시공"
	elseif ori == "energy" then return "에너지"
	elseif ori == "gravity" then return "중력"
	elseif ori == "matter" then return "물질"
	elseif ori == "paradox" then return "괴리"
	elseif ori == "speed control" then return "속도 조절"
	elseif ori == "temporal combat" then return "시간 전투기술"
	elseif ori == "timeline threading" then return "시간축 연결"
	elseif ori == "timetravel" then return "시간여행"
	elseif ori == "spacetime folding" then return "시공간 접기"
	elseif ori == "spacetime weaving" then return "시공간 엮기"
	elseif ori == "temporal archery" then return "시간 사격기술"
	elseif ori == "anomalies" then return "이상현상"
	-- corruptions
	elseif ori == "sanguisuge" then return "생명력 조작"
	elseif ori == "torment" then return "고통"
	elseif ori == "vim" then return "활력 조작"
	elseif ori == "bone" then return "해골 조작"
	elseif ori == "hexes" then return "매혹술"
	elseif ori == "curses" then return "저주"
	elseif ori == "plague" then return "질병"
	elseif ori == "scourge" then return "재앙"
	elseif ori == "reaving combat" then return "약탈 전투기술"
	elseif ori == "blood" then return "타락의 피"
	elseif ori == "blight" then return "황폐"
	elseif ori == "shadowflame" then return "어둠의 열화"
	-- cunning
	elseif ori == "stealth" then return "은신"
	elseif ori == "trapping" then return "함정"
	elseif ori == "traps" then return "함정"
	elseif ori == "poisons" then return "중독"
	elseif ori == "dirty fighting" then return "비열한 전투기술"
	elseif ori == "lethality" then return "치명상"
	elseif ori == "shadow magic" then return "그림자 마법"
	elseif ori == "ambush" then return "매복"
	elseif ori == "survival" then return "생존기술"
	elseif ori == "tactical" then return "전략"
	elseif ori == "scoundrel" then return "무뢰배 기술"
	-- cursed
	elseif ori == "slaughter" then return "대학살"
	elseif ori == "endless hunt" then return "끝없는 사냥"
	elseif ori == "strife" then return "투쟁"
	elseif ori == "gloom" then return "침울한 기운"
	elseif ori == "rampage" then return "난폭"
	elseif ori == "predator" then return "약탈자"
	elseif ori == "dark sustenance" then return "어둠의 생명유지"
	elseif ori == "force of will" then return "의지의 힘"
	elseif ori == "darkness" then return "어둠"
	elseif ori == "shadows" then return "그림자"
	elseif ori == "punishments" then return "처단"
	elseif ori == "gestures" then return "저주받은 몸짓"
	elseif ori == "cursed form" then return "저주받은 형상"
	elseif ori == "cursed aura" then return "저주받은 기운"
	elseif ori == "curses" then return "저주"
	elseif ori == "fears" then return "공포"
	-- wild gifts
	elseif ori == "call of the wild" then return "야생의 부름"
	elseif ori == "harmony" then return "조화"
	elseif ori == "antimagic" then return "반마법"
	elseif ori == "summoning (melee)" then return "근접 공격 소환수"
	elseif ori == "summoning (distance)" then return "정거리 공격 소환수 소환"
	elseif ori == "summoning (utility)" then return "유용한 소환"
	elseif ori == "summoning (augmentation)" then return "소환기술 향상"
	elseif ori == "summoning (advanced)" then return "숙련된 소환술"
	elseif ori == "slime aspect" then return "슬라임 형태"
	elseif ori == "fungus" then return "미생물"
	elseif ori == "sand drake aspect" then return "모래 드레이크 형태"
	elseif ori == "fire drake aspect" then return "화염 드레이크 형태"
	elseif ori == "cold drake aspect" then return "냉기 드레이크 형태"
	elseif ori == "storm drake aspect" then return "폭풍 드레이크 형태"
	elseif ori == "venom drake aspect" then return "독성 드레이크 형태"
	elseif ori == "higher draconic abilities" then return "드라코닉 고등기술"
	elseif ori == "mindstar mastery" then return "마석 숙달"
	elseif ori == "mucus" then return "점액"
	elseif ori == "ooze" then return "발산"
	elseif ori == "malleable body" then return "유연한 신체"
	-- psionic
	elseif ori == "absorption" then return "충격 흡수"
	elseif ori == "projection" then return "오러 발산"
	elseif ori == "psi-fighting" then return "염력 전투기술"
	elseif ori == "focus" then return "집중"
	elseif ori == "augmented mobility" then return "증대된 기동성"
	elseif ori == "voracity" then return "폭식"
	elseif ori == "finer energy manipulations" then return "향상된 에너지 조작"
	elseif ori == "mental discipline" then return "정신 훈련"
	elseif ori == "grip" then return "잡기기술"
	elseif ori == "psi-archery" then return "염력 궁술"
	elseif ori == "greater psi-fighting" then return "상위 염력 전투기술"
	elseif ori == "brainstorm" then return "창조적 생각"
	elseif ori == "discharge" then return "방출"
	elseif ori == "distortion" then return "왜곡"
	elseif ori == "dream forge" then return "꿈의 연마장"
	elseif ori == "dream smith" then return "꿈의 망치"
	elseif ori == "nightmare" then return "악몽"
	elseif ori == "psychic assault" then return "염동 공격"
	elseif ori == "slumber" then return "졸음 기술"
	elseif ori == "solipsism" then return "유아론"
	elseif ori == "thought-forms" then return "사념의 형상"
	elseif ori == "dreaming" then return "꿈의 기술"
	elseif ori == "mentalism" then return "유심론"
	elseif ori == "feedback" then return "반작용"
	elseif ori == "trance" then return "최면"
	elseif ori == "possession" then return "소유"
	-- spells
	elseif ori == "arcane" then return "비밀의 힘"
	elseif ori == "aether" then return "아이테르"
	elseif ori == "fire" then return "화염"
	elseif ori == "wildfire" then return "염화"
	elseif ori == "earth" then return "땅"
	elseif ori == "stone" then return "돌"
	elseif ori == "water" then return "물"
	elseif ori == "ice" then return "얼음"
	elseif ori == "air" then return "공기"
	elseif ori == "storm" then return "폭풍"
	elseif ori == "meta" then return "메타"
	elseif ori == "temporal" then return "시간"
	elseif ori == "phantasm" then return "환영"
	elseif ori == "enhancement" then return "강화"
	elseif ori == "conveyance" then return "전도"
	elseif ori == "divination" then return "예견"
	elseif ori == "aegis" then return "보호"
	elseif ori == "explosive" then return "폭발"
	elseif ori == "infusion" then return "주입"
	elseif ori == "golemancy" then return "골렘술"
	elseif ori == "advanced golemancy" then return "고급 골렘술"
	elseif ori == "fire alchemy" then return "불의 연금술"
	elseif ori == "stone alchemy" then return "돌의 연금술"
	elseif ori == "staff combat" then return "지팡이 전투기술"
	elseif ori == "necrotic minions" then return "사령의 추종자"
	elseif ori == "advanced necrotic minions" then return "고급 사령의 추종자"
	elseif ori == "nightfall" then return "밤의 몰락"
	elseif ori == "shades" then return "그늘"
	elseif ori == "necrosis" then return "사령술"
	elseif ori == "grave" then return "무덤"

	else return str end
end

function string.krRace(str)
	local ori = str:lower()
	if ori == "construct" then return "구조체"
	elseif ori == "runic golem" then return "룬 골렘"
	elseif ori == "dwarf" then return "드워프"
	elseif ori == "elf" then return "엘프"
	elseif ori == "shalore" then return "샬로레"
	elseif ori == "thalore" then return "탈로레"
	elseif ori == "halfling" then return "하플링"
	elseif ori == "human" then return "인간"
	elseif ori == "cornac" then return "코르낙"
	elseif ori == "higher" then return "하이어"
	elseif ori == "tutorial human" then return "연습게임용 인간"
	elseif ori == "tutorial base" then return "연습게임용 종족"
	elseif ori == "tutorial stats" then return "연습게임용 능력자"
	elseif ori == "undead" then return "언데드"
	elseif ori == "ghoul" then return "구울"
	elseif ori == "skeleton" then return "스켈레톤"
	elseif ori == "yeek" then return "이크"
	-- 위는 캐릭터 종족, 아래는 npc 종족
	elseif ori == "insect" then return "곤충"
	elseif ori == "ant" then return "개미"
	elseif ori == "aquatic" then return "수생동물"
	elseif ori == "critter" then return "미생물"
	elseif ori == "demon" then return "악마"
	elseif ori == "animal" then return "동물"
	elseif ori == "bear" then return "곰"
	elseif ori == "bird" then return "조류"
	elseif ori == "giant" then return "거인"
	elseif ori == "canine" then return "갯과"
	elseif ori == "dragon" then return "드래곤"
	elseif ori == "cold" then return "냉동"
	elseif ori == "golem" then return "골렘"
	elseif ori == "immovable" then return "부동생물"
	elseif ori == "crystal" then return "크리스탈"
	elseif ori == "elemental" then return "엘리멘탈"
	elseif ori == "light" then return "빛"
	elseif ori == "humanoid" then return "영장류"
	elseif ori == "fire" then return "화염"
	elseif ori == "feline" then return "고양이과"
	elseif ori == "ghost" then return "유령"
	elseif ori == "air" then return "공기"
	elseif ori == "horror" then return "무서운자"
	elseif ori == "temporal" then return "시간"
	elseif ori == "corrupted" then return "타락한자"
	elseif ori == "eldritch" then return "섬뜩한자"
	elseif ori == "human" then return "인간"
	elseif ori == "jelly" then return "젤리"
	elseif ori == "lich" then return "리치"
	elseif ori == "void" then return "공허"
	elseif ori == "major" then return "상위"
	elseif ori == "minor" then return "하위"
	elseif ori == "minotaur" then return "미노타우루스"
	elseif ori == "molds" then return "곰팡이"
	elseif ori == "multihued" then return "다중속성"
	elseif ori == "mummy" then return "미이라"
	elseif ori == "naga" then return "나가"
	elseif ori == "vermin" then return "해충"
	elseif ori == "oozes" then return "오즈"
	elseif ori == "orc" then return "오크"
	elseif ori == "plants" then return "식물"
	elseif ori == "ritch" then return "릿치"
	elseif ori == "rodent" then return "바퀴벌레"
	elseif ori == "sandworm" then return "지렁이"
	elseif ori == "shade" then return "그림자"
	elseif ori == "sher'tul" then return "쉐르'툴"
	elseif ori == "snake" then return "뱀"
	elseif ori == "spiderkin" then return "거미류"
	elseif ori == "spider" then return "거미"
	elseif ori == "storm" then return "폭풍"
	elseif ori == "swarms" then return "벌떼"
	elseif ori == "troll" then return "트롤"
	elseif ori == "vampire" then return "흡혈귀"
	elseif ori == "venom" then return "독성"
	elseif ori == "worms" then return "벌레"
	elseif ori == "wight" then return "와이트"
	elseif ori == "wild" then return "야생"
	elseif ori == "xorn" then return "쏜"
	elseif ori == "yaech" then return "야크"
	else return str end
end

function string.krClass(str)
	local ori = str:lower()
	if ori == "higher" then return "하이어"
	elseif ori == "adventurer" then return "모험가"
	elseif ori == "afflicted" then return "고통받는 자"
	elseif ori == "cursed" then return "저주받은 자"
	elseif ori == "doomed" then return "파멸당한 자"
	elseif ori == "celestial" then return "천공의 사도"
	elseif ori == "sun paladin" then return "태양의 기사"
	elseif ori == "anorithil" then return "아노리실"
	elseif ori == "chronomancer" then return "시공 제어사"
	elseif ori == "paradox mage" then return "괴리 마법사"
	elseif ori == "temporal warden" then return "시간의 감시자"
	elseif ori == "defiler" then return "모독자"
	elseif ori == "reaver" then return "파괴자"
	elseif ori == "curruptor" then return "타락자"
	elseif ori == "mage" then return "마법사"
	elseif ori == "alchemist" then return "연금술사"
	elseif ori == "archmage" then return "대마법사"
	elseif ori == "necromancer" then return "사령술사"
	elseif ori == "none" then return "없음"
	elseif ori == "psionic" then return "초능력자"
	elseif ori == "mindslayer" then return "정신 파괴자"
	elseif ori == "solipsist" then return "유아론자"
	elseif ori == "rogue" then return "도적"
	elseif ori == "shadowblade" then return "쉐도우블레이드"
	elseif ori == "marauder" then return "약탈자"
	elseif ori == "tutorial adventurer" then return "초보자 입문용 모험가"
	elseif ori == "warrior" then return "전사"
	elseif ori == "berserker" then return "광전사"
	elseif ori == "bulwark" then return "수호자"
	elseif ori == "archer" then return "궁수"
	elseif ori == "arcane blade" then return "마법 전사"
	elseif ori == "brawler" then return "격투가"
	elseif ori == "wilder" then return "자연의 추종자"
	elseif ori == "summoner" then return "소환술사"
	elseif ori == "wyrmic" then return "워믹"
	else return str end
end

function string.krSize(str)
	local ori = str:lower()
	if ori == "tiny" then return "조그마함"
	elseif ori == "small" then return "작음"
	elseif ori == "medium" then return "평균적"
	elseif ori == "big" then return "큼"
	elseif ori == "huge" then return "거대함"
	elseif ori == "gargantuan" then return "어마어마함"
	else return str end
end

function string.krRank(str)
	local ori = str:lower()
	if ori == "normal" then return "평범"
	elseif ori == "critter" then return "떨어짐"
	elseif ori == "elite" then return "정예"
	elseif ori == "rare" then return "진귀함"
	elseif ori == "unique" then return "유일함"
	elseif ori == "boss" then return "보스"
	elseif ori == "elite boss" then return "정예 보스"
	else return str end
end

function string.krFaction(str)
	local ori = str:lower()
	if ori == "rhalore" then return "랄로레"
	elseif ori == "fearscape" then return "공포의 영역"
	elseif ori == "orc pride" then return "오크의 자부심"
	elseif ori == "sunwall" then return "해의 장벽"
	elseif ori == "zigur" then return "지구르"
	elseif ori == "angolwen" then return "앙골웬"
	elseif ori == "iron throne" then return "철의 왕좌"
	elseif ori == "undead" then return "언데드"
	elseif ori == "shalore" then return "샬로레"
	elseif ori == "thalore" then return "탈로레"
	elseif ori == "allied kingdoms" then return "왕국연합"
	elseif ori == "the way" then return "한길"
	else return str end
end

function string.krMonth(str)
	local ori = str:lower()
	if ori == "wintertide" then return "밀려오는 추위의 달"
	elseif ori == "allure" then return "매혹의 달"
	elseif ori == "regworth" then return "재성장의 달"
	elseif ori == "time of balance" then return "균형의 달"
	elseif ori == "pyre" then return "장작더미의 달"
	elseif ori == "mirth" then return "환희의 달"
	elseif ori == "summertide" then return "밀려오는 더위의 달"
	elseif ori == "flare" then return "타오름의 달"
	elseif ori == "dusk" then return "황혼의 달"
	elseif ori == "time of equilibrium" then return "평정의 달"
	elseif ori == "haze" then return "몽롱한 달"
	elseif ori == "decay" then return "부패의 달"
	-- 위는 동맹 연합 달력, 아래는 드워프 달력
	elseif ori == "iron" then return "철의 달"
	elseif ori == "steel" then return "강철의 달"
	elseif ori == "gold" then return "금의 달"
	elseif ori == "stralite" then return "스트라라이트의 달"
	elseif ori == "voratun" then return "보라툰의 달"
	elseif ori == "acquisition" then return "습득의 달"
	elseif ori == "profit" then return "이익의 달"
	elseif ori == "wealth" then return "재산의 달"
	elseif ori == "dearth" then return "결핍의 달"
	elseif ori == "loss" then return "손실의 달"
	elseif ori == "shortage" then return "부족의 달"
	else return str end
end

