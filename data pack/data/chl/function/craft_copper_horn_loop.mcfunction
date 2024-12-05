execute if entity @s[type=!minecraft:item] run return fail
$execute store success storage chl:temp craftSuccess byte 1 run data modify storage chl:temp instrument set from storage chl:data craftingInput[$(index)]
execute if data storage chl:temp {craftSuccess:0b} run data merge storage chl:temp {craftTotalSuccess:1b}
execute if data storage chl:temp {craftSuccess:0b} run data merge entity @s {Item:{components:{"minecraft:item_name":'{"translate":"item.chl.copper_horn"}',"minecraft:instrument":"chl:copper_horn","minecraft:item_model":"chl:copper_horn","minecraft:hide_additional_tooltip":{},"minecraft:custom_data":{isCopperHorn:1b}}}}
$execute if data storage chl:temp {craftSuccess:0b} run data modify storage chl:temp output set from storage chl:data craftingOutput[$(index)]
execute if data storage chl:temp {craftSuccess:0b} run function chl:finish_crafting_copper_horn with storage chl:temp
execute if data storage chl:temp {craftSuccess:0b} run return 1

scoreboard players add &craftIndex chl.useCopperHorn 1
data modify storage chl:temp instrument set from entity @s Item.components."minecraft:instrument"
execute store result storage chl:temp index int 1 run scoreboard players get &craftIndex chl.useCopperHorn
execute if score &craftIndex chl.useCopperHorn < &craftMax chl.useCopperHorn run function chl:craft_copper_horn_loop with storage chl:temp