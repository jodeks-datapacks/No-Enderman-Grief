#> no_enderman_grief:image/process/generate
#
# This function generates the image data.

data modify storage no_enderman_grief:image data.current.image_data set from storage no_enderman_grief:image data.image_data
data modify storage no_enderman_grief:image data.current.description set from storage no_enderman_grief:image data.description
data modify storage no_enderman_grief:image data.current.pixel_character set from storage no_enderman_grief:image data.pixel_character.pixel

# Reset index score
scoreboard players set $index.image_data no_enderman_grief.image 0
# Set width
execute store result score $width no_enderman_grief.image run data get storage no_enderman_grief:image data.width
# Set height
execute store result score $height no_enderman_grief.image run data get storage no_enderman_grief:image data.height
# Set length
scoreboard players operation $length no_enderman_grief.image = $width no_enderman_grief.image
scoreboard players operation $length no_enderman_grief.image *= $height no_enderman_grief.image
# Clear remaining entries in tellraw
data remove storage no_enderman_grief:image data.tellraw

# Add spacing on top
function no_enderman_grief:image/process/append/line_break
# Loop over image data
function no_enderman_grief:image/process/loop_over_image_data
# Add spacing on bottom
function no_enderman_grief:image/process/append/line_break