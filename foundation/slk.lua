local HSK = {
    COMMON = 99,
    PLAYER_MAP_LEVEL_AWARD_MAX = 100,
    PLAYER_MAP_LEVEL_AWARD = 101,
    UNIT_TOKEN = 102,
    UNIT_TOKEN_LEAP = 103,
    UNIT_TREE = 104,
    SKILL_ITEM_SEPARATE = 105,
    SKILL_BREAK = 106,
    SKILL_SWIM_UNLIMIT = 107,
    SKILL_INVISIBLE = 108,
    SKILL_HERO_TAVERN_SELECTION = 109,
    UNIT_HERO_TAVERN = 110,
    UNIT_HERO_TAVERN_TOKEN = 111,
    UNIT_HERO_DEATH_TOKEN = 112,
    ITEM_MOMENT = 113,
    ATTR_STR_GREEN_ADD = 114,
    ATTR_STR_GREEN_SUB = 115,
    ATTR_AGI_GREEN_ADD = 116,
    ATTR_AGI_GREEN_SUB = 117,
    ATTR_INT_GREEN_ADD = 118,
    ATTR_INT_GREEN_SUB = 119,
    ATTR_ATTACK_GREEN_ADD = 120,
    ATTR_ATTACK_GREEN_SUB = 121,
    ATTR_ATTACK_WHITE_ADD = 122,
    ATTR_ATTACK_WHITE_SUB = 123,
    ATTR_ITEM_ATTACK_WHITE_ADD = 124,
    ATTR_ITEM_ATTACK_WHITE_SUB = 125,
    ATTR_ATTACK_SPEED_ADD = 126,
    ATTR_ATTACK_SPEED_SUB = 127,
    ATTR_DEFEND_ADD = 128,
    ATTR_DEFEND_SUB = 129,
    ATTR_MANA_ADD = 130,
    ATTR_MANA_SUB = 131,
    ATTR_LIFE_ADD = 132,
    ATTR_LIFE_SUB = 133,
    ATTR_AVOID_ADD = 134,
    ATTR_AVOID_SUB = 135,
    ATTR_SIGHT_ADD = 136,
    ATTR_SIGHT_SUB = 137,
    ENV_MODEL_NAME = 138,
    ENV_MODEL = 139,
    EX_SHAPESHIFT = 200
}

hslk_global = {
    dzapi_map_level_award = {},
    item_moment = {},
    env_model = {},
    skill_item_separate = 0,
    skill_break = {},
    skill_swim_unlimit = 0,
    skill_hero_tavern_selection = 0,
    skill_shapeshift = {},
    unit_token = 0,
    unit_token_leap = 0,
    unit_hero_tavern = 0, -- 酒馆id
    unit_hero_tavern_token = 0, -- 酒馆选择马甲id（视野）
    unit_hero_death_token = 0,
    heroesLen = 0,
    heroes = {},
    heroesKV = {},
    heroesItems = {},
    heroesItemsKV = {},
    unitsKV = {},
    itemsKV = {},
    itemsShadowKV = {},
    itemsFaceKV = {},
    abilitiesKV = {},
    attr = {
        agi_green = {
            add = {},
            sub = {}
        },
        int_green = {
            add = {},
            sub = {}
        },
        str_green = {
            add = {},
            sub = {}
        },
        attack_green = {
            add = {},
            sub = {}
        },
        attack_white = {
            add = {},
            sub = {}
        },
        item_attack_white = {
            add = {},
            sub = {}
        },
        attack_speed = {
            add = {},
            sub = {}
        },
        defend = {
            add = {},
            sub = {}
        },
        life = {
            add = {},
            sub = {}
        },
        mana = {
            add = {},
            sub = {}
        },
        avoid = {
            add = 0,
            sub = 0
        },
        sight = {
            add = {},
            sub = {}
        },
        ablisGradient = {},
        sightGradient = {}
    }
}

-- skill_item_separate
hslk_global.skill_item_separate = cj.LoadInteger(cg.hash_hslk, HSK.COMMON, HSK.SKILL_ITEM_SEPARATE)
-- skill_break
for dur = 1, 10, 1 do
    local swDur = dur * 0.05
    hslk_global.skill_break[swDur] = cj.LoadInteger(cg.hash_hslk, HSK.SKILL_BREAK, dur)
end
-- skill_swim_unlimit
hslk_global.skill_swim_unlimit = cj.LoadInteger(cg.hash_hslk, HSK.COMMON, HSK.SKILL_SWIM_UNLIMIT)
-- skill_invisible
hslk_global.skill_invisible = cj.LoadInteger(cg.hash_hslk, HSK.COMMON, HSK.SKILL_INVISIBLE)
-- skill_hero_tavern_selection
hslk_global.skill_hero_tavern_selection = cj.LoadInteger(cg.hash_hslk, HSK.COMMON, HSK.SKILL_HERO_TAVERN_SELECTION)

-- unit_token
hslk_global.unit_token = cj.LoadInteger(cg.hash_hslk, HSK.COMMON, HSK.UNIT_TOKEN)
-- unit_token_leap
hslk_global.unit_token_leap = cj.LoadInteger(cg.hash_hslk, HSK.COMMON, HSK.UNIT_TOKEN_LEAP)
-- unit_tree
hslk_global.unit_tree = cj.LoadInteger(cg.hash_hslk, HSK.COMMON, HSK.UNIT_TREE)
-- unit_hero_tavern
hslk_global.unit_hero_tavern = cj.LoadInteger(cg.hash_hslk, HSK.COMMON, HSK.UNIT_HERO_TAVERN)
-- unit_hero_tavern_token
hslk_global.unit_hero_tavern_token = cj.LoadInteger(cg.hash_hslk, HSK.COMMON, HSK.UNIT_HERO_TAVERN_TOKEN)
-- unit_hero_death_token
hslk_global.unit_hero_death_token = cj.LoadInteger(cg.hash_hslk, HSK.COMMON, HSK.UNIT_HERO_DEATH_TOKEN)

-- 地图等级奖励
local qty = cj.LoadInteger(cg.hash_hslk, HSK.PLAYER_MAP_LEVEL_AWARD, -1)
for i = 1, qty do
    table.insert(hslk_global.dzapi_map_level_award, cj.LoadInteger(cg.hash_hslk, HSK.PLAYER_MAP_LEVEL_AWARD, i))
end

-- 瞬逝物系统
qty = cj.LoadInteger(cg.hash_hslk, HSK.ITEM_MOMENT, -1)
for i = 1, qty do
    table.insert(hslk_global.item_moment, cj.LoadInteger(cg.hash_hslk, HSK.ITEM_MOMENT, i))
end

-- 环境系统
qty = cj.LoadInteger(cg.hash_hslk, HSK.COMMON, HSK.ENV_MODEL)
for i = 1, qty do
    local key = cj.LoadStr(cg.hash_hslk, HSK.ENV_MODEL_NAME, i)
    local val = cj.LoadInteger(cg.hash_hslk, HSK.ENV_MODEL, i)
    hslk_global.env_model[key] = val
end

-- 属性系统
for i = 1, 9 do
    local val = math.floor(10 ^ (i - 1))
    table.insert(hslk_global.attr.ablisGradient, val)
    hslk_global.attr.str_green.add[val] = cj.LoadInteger(cg.hash_hslk, HSK.ATTR_STR_GREEN_ADD, val)
    hslk_global.attr.str_green.sub[val] = cj.LoadInteger(cg.hash_hslk, HSK.ATTR_STR_GREEN_SUB, val)
    hslk_global.attr.agi_green.add[val] = cj.LoadInteger(cg.hash_hslk, HSK.ATTR_AGI_GREEN_ADD, val)
    hslk_global.attr.agi_green.sub[val] = cj.LoadInteger(cg.hash_hslk, HSK.ATTR_AGI_GREEN_SUB, val)
    hslk_global.attr.int_green.add[val] = cj.LoadInteger(cg.hash_hslk, HSK.ATTR_INT_GREEN_ADD, val)
    hslk_global.attr.int_green.sub[val] = cj.LoadInteger(cg.hash_hslk, HSK.ATTR_INT_GREEN_SUB, val)
    hslk_global.attr.attack_green.add[val] = cj.LoadInteger(cg.hash_hslk, HSK.ATTR_ATTACK_GREEN_ADD, val)
    hslk_global.attr.attack_green.sub[val] = cj.LoadInteger(cg.hash_hslk, HSK.ATTR_ATTACK_GREEN_SUB, val)
    hslk_global.attr.attack_white.add[val] = cj.LoadInteger(cg.hash_hslk, HSK.ATTR_ATTACK_WHITE_ADD, val)
    hslk_global.attr.attack_white.sub[val] = cj.LoadInteger(cg.hash_hslk, HSK.ATTR_ATTACK_WHITE_SUB, val)
    hslk_global.attr.item_attack_white.add[val] = cj.LoadInteger(cg.hash_hslk, HSK.ATTR_ITEM_ATTACK_WHITE_ADD, val)
    hslk_global.attr.item_attack_white.sub[val] = cj.LoadInteger(cg.hash_hslk, HSK.ATTR_ITEM_ATTACK_WHITE_SUB, val)
    hslk_global.attr.attack_speed.add[val] = cj.LoadInteger(cg.hash_hslk, HSK.ATTR_ATTACK_SPEED_ADD, val)
    hslk_global.attr.attack_speed.sub[val] = cj.LoadInteger(cg.hash_hslk, HSK.ATTR_ATTACK_SPEED_SUB, val)
    hslk_global.attr.defend.add[val] = cj.LoadInteger(cg.hash_hslk, HSK.ATTR_DEFEND_ADD, val)
    hslk_global.attr.defend.sub[val] = cj.LoadInteger(cg.hash_hslk, HSK.ATTR_DEFEND_SUB, val)
    hslk_global.attr.life.add[val] = cj.LoadInteger(cg.hash_hslk, HSK.ATTR_LIFE_ADD, val)
    hslk_global.attr.life.sub[val] = cj.LoadInteger(cg.hash_hslk, HSK.ATTR_LIFE_SUB, val)
    hslk_global.attr.mana.add[val] = cj.LoadInteger(cg.hash_hslk, HSK.ATTR_MANA_ADD, val)
    hslk_global.attr.mana.sub[val] = cj.LoadInteger(cg.hash_hslk, HSK.ATTR_MANA_SUB, val)
end
-- 属性系统 回避
hslk_global.attr.avoid.add = cj.LoadInteger(cg.hash_hslk, HSK.ATTR_AVOID_ADD, 0)
hslk_global.attr.avoid.sub = cj.LoadInteger(cg.hash_hslk, HSK.ATTR_AVOID_SUB, 0)
-- 属性系统 视野
local sightBase = {1, 2, 3, 4, 5}
local si = 1
while (si <= 10000) do
    for _, v in ipairs(sightBase) do
        v = math.floor(v * si)
        table.insert(hslk_global.attr.sightGradient, v)
        hslk_global.attr.sight.add[v] = cj.LoadInteger(cg.hash_hslk, HSK.ATTR_SIGHT_ADD, v)
        hslk_global.attr.sight.sub[v] = cj.LoadInteger(cg.hash_hslk, HSK.ATTR_SIGHT_SUB, v)
    end
    si = si * 10
end
table.sort(
    hslk_global.attr.sightGradient,
    function(a, b)
        return a > b
    end
)
-- 变身(仅作演示)
local toUnitId = cj.LoadInteger(cg.hash_hslk, HSK.EX_SHAPESHIFT, 1)
local toAbilityId = cj.LoadInteger(cg.hash_hslk, HSK.EX_SHAPESHIFT, 2)
local backAbilityId = cj.LoadInteger(cg.hash_hslk, HSK.EX_SHAPESHIFT, 3)
hslk_global.skill_shapeshift[toUnitId] = {
    toAbilityId = toAbilityId,
    backAbilityId = backAbilityId
}

cj.FlushParentHashtable(cg.hash_hslk)
