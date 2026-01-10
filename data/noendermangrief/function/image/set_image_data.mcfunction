#> noendermangrief:image/set_image_data
#
# This function sets the image data.
#
# @input $(image_data) {string[][]} The data to set  
# @input $(width) {number} The width of the image  
# @input $(height) {number} The height of the image  
# @input $(background_color) {string} The background color of the image  
# @input $(description) {string[]} The description on the right hand side  
# @writes storage noendermangrief:image image_data  
# @writes storage noendermangrief:image width  
# @writes storage noendermangrief:image height  
# @writes storage noendermangrief:image background_color  
# @writes storage noendermangrief:image description  
# @writes storage noendermangrief:image pixel_character.blank  
# @writes storage noendermangrief:image pixel_character.chat  
# @writes storage noendermangrief:image pixel_character.lore

data remove storage noendermangrief:image image_data
data remove storage noendermangrief:image width
data remove storage noendermangrief:image height
data remove storage noendermangrief:image background_color
data remove storage noendermangrief:image description

$data modify storage noendermangrief:image image_data set value $(image_data)
$data modify storage noendermangrief:image width set value $(width)
$data modify storage noendermangrief:image height set value $(height)
$data modify storage noendermangrief:image background_color set value "$(background_color)"
$data modify storage noendermangrief:image description set value $(description)

data modify storage noendermangrief:image pixel_character.blank set value "　"
data modify storage noendermangrief:image pixel_character.pixel set value "▌▌"
data modify storage noendermangrief:image pixel_character.line_break set value '\n'

function noendermangrief:image/process/generate
