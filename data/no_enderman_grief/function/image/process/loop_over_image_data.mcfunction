# Copy current pixel
data modify storage no_enderman_grief:image data.current.pixel_color set \
  from storage no_enderman_grief:image data.current.image_data[0]
data modify storage no_enderman_grief:image data.current.description_text set \
  from storage no_enderman_grief:image data.current.description[0]

scoreboard players add $index.image_data no_enderman_grief.image 1

# Calculate column
scoreboard players operation $index.column no_enderman_grief.image = $index.image_data no_enderman_grief.image
scoreboard players operation $index.column no_enderman_grief.image %= $width no_enderman_grief.image

# Calculate row
scoreboard players operation $index.row no_enderman_grief.image = $index.image_data no_enderman_grief.image
scoreboard players operation $index.row no_enderman_grief.image /= $width no_enderman_grief.image

# Append start spacing
execute if score $index.column no_enderman_grief.image matches 1 run \
  function no_enderman_grief:image/process/append/blank

# Append colored pixel
execute unless data storage no_enderman_grief:image data.current{pixel_color: ''} run \
  function no_enderman_grief:image/process/append/pixel
# Append background pixel
execute if data storage no_enderman_grief:image data.current{pixel_color: ''} run \
  function no_enderman_grief:image/process/append/background

# Append description
execute if score $index.column no_enderman_grief.image matches 0 run \
    function no_enderman_grief:image/process/image_end/description

# Remove first element from the image_data array
data remove storage no_enderman_grief:image data.current.image_data[0]
# Loop over rows
execute if score $index.row no_enderman_grief.image < $height no_enderman_grief.image run \
  function no_enderman_grief:image/process/loop_over_image_data
 