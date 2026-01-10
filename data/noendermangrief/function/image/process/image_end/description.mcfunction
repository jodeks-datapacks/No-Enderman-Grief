# Append blank
function noendermangrief:image/process/append/blank

data modify storage noendermangrief:image tellraw append \
  from storage noendermangrief:image current.description_text

# Append blank
function noendermangrief:image/process/append/blank

# Append line_break
execute unless score $index.image_data noendermangrief.image = $length noendermangrief.image \
  run function noendermangrief:image/process/append/line_break

# Remove first element from the description
data remove storage noendermangrief:image current.description[0]
 