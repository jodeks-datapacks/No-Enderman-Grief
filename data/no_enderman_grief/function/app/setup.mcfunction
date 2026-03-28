scoreboard objectives add jodek.config dummy
execute unless score &no_enderman_grief_load_message jodek.config = &no_enderman_grief_load_message jodek.config run scoreboard players set &no_enderman_grief_load_message jodek.config 1
execute unless score &no_enderman_grief_advancements jodek.config = &no_enderman_grief_advancements jodek.config run scoreboard players set &no_enderman_grief_advancements jodek.config 1

scoreboard objectives add no_enderman_grief.image dummy

# Print the image
function no_enderman_grief:config/image