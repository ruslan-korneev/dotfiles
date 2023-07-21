local keymap = vim.keymap

keymap.set('n', 'x', '"_x')
keymap.set('n', 'GG', 'G')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', ':tabedit<cr>')
keymap.set('n', 't.', ':tabmove +1<cr>')
keymap.set('n', 't,', ':tabmove -1<cr>')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Escape from insert mode
keymap.set('i', 'jj', '<esc>')

-- Quit, Save, Quit+Save
keymap.set('n', 'qq', ':q<cr>')
keymap.set('n', 'ww', ':w<cr>')
keymap.set('n', 'wq', ':w<cr>')
keymap.set('n', 'qa', ':q!<cr>')

-- Nohle search
keymap.set('n', ',<space>', ':nohlsearch<cr>')

-- Buffer navigation
keymap.set('n', 'gp', ':bp<cr>')
keymap.set('n', 'gn', ':bn<cr>')
keymap.set('n', 'gw', ':bdelete<cr>')
