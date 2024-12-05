execute as @a[scores={chl.useCopperHorn=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:goat_horn",components:{"minecraft:custom_data":{isCopperHorn:1b}}}}] run function chl:play_copper_horn_mainhand
execute as @a[scores={chl.useCopperHorn=1..}] unless entity @s[nbt={SelectedItem:{id:"minecraft:goat_horn"}}] if entity @s[nbt={Inventory:[{id:"minecraft:goat_horn",components:{"minecraft:custom_data":{isCopperHorn:1b}},Slot:-106b}]}] run function chl:play_copper_horn_offhand
scoreboard players set @a[scores={chl.sneaking=1..}] chl.sneaking 0
scoreboard players reset @a chl.useCopperHorn
execute as @e[type=item,nbt={Item:{id:"minecraft:goat_horn"}}] at @s if block ~ ~-1 ~ minecraft:crafting_table run function chl:craft_copper_horn
schedule function chl:tick 1t replace