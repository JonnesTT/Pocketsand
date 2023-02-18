scoreboard players operation @s pocketsand_uses -= %numbers one
data modify storage pocketsand item set value {id:"minecraft:bundle",Count:1,tag:{Items:[{id:"minecraft:sand",Count:1}],display:{Name:'{"text":"Pocket Sand"}',Lore:['{"text":"It\'s sand!","bold":true}']}}} 
execute store result storage pocketsand item.tag.Items[0].Count int 1.0 run scoreboard players get @s pocketsand_uses

setblock 0 1 0 shulker_box replace
data modify block 0 1 0 Items insert 0 from storage pocketsand item
data remove storage pocketsand item

execute positioned ^ ^ ^2.1 run effect give @e[distance=..2] blindness 5 1
execute positioned ^ ^ ^2.1 run effect give @e[distance=..2] slowness 2 2 
execute positioned ^ ^ ^2.1 run effect give @e[distance=..2] weakness 1 7

particle minecraft:dust 0.7794 0.6764 0.5442 1 ^ ^1.62 ^2 1 1 1 1 80 normal


execute as @a[predicate=pocketsand:nbt_checks/pocketsand_is_mainhand] at @s run function pocketsand:effects/pocket_sand/mainhand_use
execute as @a[predicate=pocketsand:nbt_checks/pocketsand_is_offhand] unless entity @s[predicate=pocketsand:nbt_checks/pocketsand_is_mainhand] at @s run function pocketsand:effects/pocket_sand/offhand_use

kill @e[type=item,nbt={Item:{id:"minecraft:sand"}},sort=nearest,limit=1]

setblock 0 1 0 air replace

scoreboard players set @s bundle_use 0