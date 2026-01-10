#> noendermangrief:image/process/generate
#
# This function generates the image data.

data modify storage noendermangrief:image current.image_data set from storage noendermangrief:image image_data
data modify storage noendermangrief:image current.description set from storage noendermangrief:image description
data modify storage noendermangrief:image current.pixel_character set from storage noendermangrief:image pixel_character.pixel

# Reset index score
scoreboard players set $index.image_data noendermangrief.image 0
# Set width
execute store result score $width noendermangrief.image run data get storage noendermangrief:image width
# Set height
execute store result score $height noendermangrief.image run data get storage noendermangrief:image height
# Set length
scoreboard players operation $length noendermangrief.image = $width noendermangrief.image
scoreboard players operation $length noendermangrief.image *= $height noendermangrief.image
# Clear remaining entries in tellraw
data remove storage noendermangrief:image tellraw

# Add spacing on top
function noendermangrief:image/process/append/line_break
# Loop over image data
function noendermangrief:image/process/loop_over_image_data
# Add spacing on bottom
function noendermangrief:image/process/append/line_break