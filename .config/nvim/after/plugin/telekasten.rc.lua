local status, telekasten = pcall(require, "telekasten")
if (not status) then return end

local HOME = vim.fn.expand("~/notes")
local TEMPLATES_DIR = HOME .. "/templates"

telekasten.setup({
  home = HOME,
  take_over_my_home = true,
  auto_set_filetype = false,
  dailies = HOME .. "/dailies",
  weeklies = HOME .. "/weeklies",
  templates = TEMPLATES_DIR,
  image_subdir = HOME .. "/assets",
  extension = ".md",
  new_note_filename = "uuid-title",
  uuid_type = "%Y-%m-%d",
  uuid_sep = " ",
  follow_creates_nonexisting = true,
  dailies_create_nonexisting = true,
  weeklies_create_nonexisting = true,
  journal_auto_open = false,
  template_new_note = TEMPLATES_DIR .. "/zettel template.md",
  template_new_daily = TEMPLATES_DIR .. "/daily template.md",
  template_new_weekly = TEMPLATES_DIR .. "/weekly template.md",
  image_link_style = "wiki",
  sort = "filename",
  plug_into_calendar = true,
  calendar_opts = {
    weeknm = 1,
    calendar_monday = 1,
    calendar_mark = "left-fit",
  },
  close_after_yanking = true,
  insert_after_inserting = true,
  tag_notation = "#tag",
  command_palette_theme = "ivy",
  show_tags_theme = "ivy",
  subdirs_in_links = false,
  template_handling = "prefer_new_note",
  new_note_location = "prefere_home",
  rename_update_links = true,
  media_previewr = "telescope-media-files",
})

-- Mappings

-- Launch panel if nothing is typed after <leader>z
vim.keymap.set("n", ";zz", "<cmd>Telekasten panel<cr>")

-- Most used functions
vim.keymap.set("n", ";zf", "<cmd>Telekasten find_notes<cr>")
vim.keymap.set("n", ";zr", "<cmd>Telekasten search_notes<cr>")
vim.keymap.set("n", ";zd", "<cmd>Telekasten goto_today<cr>")
vim.keymap.set("n", ";zt", "<cmd>Telekasten toggle_todo<cr>")
vim.keymap.set("n", ";zy", "<cmd>Telekasten yank_notelink<cr>")
vim.keymap.set("n", ";zl", "<cmd>Telekasten follow_link<cr>")
vim.keymap.set("n", ";zn", "<cmd>Telekasten new_note<cr>")
vim.keymap.set("n", ";zN", "<cmd>Telekasten new_templated_note<cr>")
vim.keymap.set("n", ";cc", "<cmd>Telekasten show_calendar<cr>")
vim.keymap.set("n", ";zb", "<cmd>Telekasten show_backlinks<cr>")
vim.keymap.set("n", ";zI", "<cmd>Telekasten insert_img_link<cr>")

-- Call insert link automatically when we start typing a link
vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<cr>")
