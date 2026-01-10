# Copy current pixel
data modify storage noendermangrief:image current.pixel_color set \
  from storage noendermangrief:image current.image_data[0]
data modify storage noendermangrief:image current.description_text set \
  from storage noendermangrief:image current.description[0]

scoreboard players add $index.image_data noendermangrief.image 1

# Calculate column
scoreboard players operation $index.column noendermangrief.image = $index.image_data noendermangrief.image
scoreboard players operation $index.column noendermangrief.image %= $width noendermangrief.image

# Calculate row
scoreboard players operation $index.row noendermangrief.image = $index.image_data noendermangrief.image
scoreboard players operation $index.row noendermangrief.image /= $width noendermangrief.image

# Append start spacing
execute if score $index.column noendermangrief.image matches 1 run \
  function noendermangrief:image/process/append/blank

# Append colored pixel
execute unless data storage noendermangrief:image current{pixel_color: ''} run \
  function noendermangrief:image/process/append/pixel
# Append background pixel
execute if data storage noendermangrief:image current{pixel_color: ''} run \
  function noendermangrief:image/process/append/background

# Append description
execute if score $index.column noendermangrief.image matches 0 run \
    function noendermangrief:image/process/image_end/description

# Remove first element from the image_data array
data remove storage noendermangrief:image current.image_data[0]
# Loop over rows
execute if score $index.row noendermangrief.image < $height noendermangrief.image run \
  function noendermangrief:image/process/loop_over_image_data
 