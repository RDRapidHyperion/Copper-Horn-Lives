execute as @a[scores={chl.useCopperHorn=1..}] if items entity @s weapon.mainhand minecraft:goat_horn[minecraft:instrument="chl:copper_horn"] run function chl:play_copper_horn_mainhand
execute as @a[scores={chl.useCopperHorn=1..}] unless items entity @s weapon.mainhand minecraft:goat_horn[minecraft:instrument="chl:copper_horn"] if items entity @s weapon.offhand minecraft:goat_horn[minecraft:instrument="chl:copper_horn"] run function chl:play_copper_horn_offhand
scoreboard players set @a[scores={chl.sneaking=1..}] chl.sneaking 0
scoreboard players reset @a chl.useCopperHorn
execute as @e[type=item,nbt={Item:{id:"minecraft:goat_horn"}}] at @s if block ~ ~-1 ~ minecraft:crafting_table run function chl:craft_copper_horn
schedule function chl:tick 1t replace