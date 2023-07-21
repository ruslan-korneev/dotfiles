require('ruslan.base')
require('ruslan.highlights')
require('ruslan.maps')
require('ruslan.plugins')

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"
local is_wsl = has "wsl"

if is_mac == 1 then
  require('ruslan.macos')
end
if is_win == 1 then
  require('ruslan.windows')
end
if is_wsl == 1 then
  require('ruslan.wsl')
else
  require('ruslan.linux')
end
