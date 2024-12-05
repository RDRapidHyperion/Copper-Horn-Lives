execute store result score @s chl.useCopperHorn run data get entity @s Rotation[1]
data modify storage chl:temp pitch set value "melody"
execute if score @s chl.useCopperHorn matches ..-45 run data modify storage chl:temp pitch set value "harmony"
execute if score @s chl.sneaking matches 1.. run data modify storage chl:temp pitch set value "bass"
data modify storage chl:temp chlTune set from entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".chlTune
execute at @s run function chl:play_sound with storage chl:temp
data remove storage chl:temp pitch
data remove storage chl:temp chlTune
scoreboard players reset @s chl.useCopperHorn