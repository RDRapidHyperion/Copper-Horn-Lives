# Check for fail conditions
execute if entity @s[type=!minecraft:item] run return fail
execute if items entity @s container.0 minecraft:goat_horn[minecraft:instrument="chl:copper_horn"] run tag @s add chl.uncraftable
execute if items entity @s container.0 minecraft:goat_horn[minecraft:instrument="chl:copper_horn"] run return fail
execute unless entity @e[type=item,distance=..1,nbt={Item:{id:"minecraft:copper_ingot",count:3}}] run return fail
execute if entity @s[tag=chl.uncraftable] run return fail

tag @s add chl.uncraftable
scoreboard players set &craftIndex chl.useCopperHorn 0
execute store result score &craftMax chl.useCopperHorn run data get storage chl:data craftingOutput

execute store result storage chl:temp index int 1 run scoreboard players get &craftIndex chl.useCopperHorn
data modify storage chl:temp instrument set from entity @s Item.components."minecraft:instrument"
function chl:craft_copper_horn_loop with storage chl:temp

execute if data storage chl:temp {craftTotalSuccess:1b} run particle minecraft:wax_on ~ ~ ~ 0.1 0.1 0.1 10 50 normal @a
execute if data storage chl:temp {craftTotalSuccess:1b} run playsound minecraft:entity.villager.work_fletcher player @a ~ ~ ~ 1 1
execute if data storage chl:temp {craftTotalSuccess:1b} run kill @e[type=item,distance=..1,nbt={Item:{id:"minecraft:copper_ingot",count:3}},sort=nearest,limit=1]
execute unless data storage chl:temp {craftTotalSuccess:1b} run playsound minecraft:entity.item.break player @a ~ ~ ~ 1 1
execute unless data storage chl:temp {craftTotalSuccess:1b} run particle minecraft:smoke ~ ~ ~ 0.1 0.1 0.1 0 10 normal @a

scoreboard players reset &craftIndex chl.useCopperHorn
scoreboard players reset &craftMax chl.useCopperHorn
data remove storage chl:temp craftSuccess
data remove storage chl:temp craftTotalSuccess
data remove storage chl:temp instrument
data remove storage chl:temp index
data remove storage chl:temp output


