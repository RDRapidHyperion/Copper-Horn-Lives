#Add data for the crafting system
execute unless data storage chl:data craftingInput run data merge storage chl:data {craftingInput:["minecraft:ponder_goat_horn","minecraft:sing_goat_horn","minecraft:seek_goat_horn","minecraft:feel_goat_horn","minecraft:admire_goat_horn","minecraft:call_goat_horn","minecraft:yearn_goat_horn","minecraft:dream_goat_horn","chl:fly_goat_horn","chl:resist_goat_horn"]}
execute unless data storage chl:data craftingOutput run data merge storage chl:data {craftingOutput:["great_sky_falling","old_hymn_resting","pure_water_desire","mumble_fire_memory","dry_urge_anger","clear_temper_journey","fresh_nest_thought","secret_lake_tear","fearless_river_gift","sweet_moon_love"]}

#Check for old Copper Horn Lives
execute store success storage chl:temp checkOldVersion byte 1 run scoreboard objectives add chl.angle dummy
execute if data storage chl:temp {checkOldVersion:0b} run tellraw @a [{text:"WARNING!",bold:true,color:"red"}]
execute if data storage chl:temp {checkOldVersion:0b} run tellraw @a [{text:"You previously used the old version of Copper Horn Lives. The new data pack is incompatible with this and old copper horns will not function.",color:"red"}]
data remove storage chl:temp checkOldVersion
scoreboard objectives remove chl.angle

#Add new objectives
scoreboard objectives add chl.useCopperHorn minecraft.used:minecraft.goat_horn
scoreboard objectives add chl.sneaking minecraft.custom:minecraft.sneak_time

#Run tick function
schedule function chl:tick 1t replace