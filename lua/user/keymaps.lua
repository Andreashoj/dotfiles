lvim.leader = "space"

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-t>"] = ":TroubleToggle<CR>"
lvim.keys.normal_mode["<C-t>"] = ":Trouble<CR>"
lvim.keys.normal_mode["<C-b>"] = ":GitMessenger<CR>"
lvim.keys.normal_mode["<Leader>bo"] = ':%bd!|e #|bd #|normal`"<CR>'
lvim.keys.normal_mode["F"] = ":HopChar2<CR>"
lvim.keys.normal_mode["f"] = ":HopChar1CurrentLine<CR>"
lvim.keys.normal_mode["<Leader>gB"] = ":ls<cr>:buffer<space>"

lvim.keys.normal_mode["<Leader>gf"] = ":CellularAutomaton make_it_rain<CR>"

-- Harppon
lvim.keys.normal_mode["<leader>a"] = ":lua require(\"harpoon.mark\").add_file()<CR>"
lvim.keys.normal_mode["<leader>H"] = ":lua require(\"harpoon.ui\").toggle_quick_menu()<CR>"

lvim.keys.normal_mode["<leader>1"] = ":lua require(\"harpoon.ui\").nav_file(1)<CR>"
lvim.keys.normal_mode["<leader>2"] = ":lua require(\"harpoon.ui\").nav_file(2)<CR>"
lvim.keys.normal_mode["<leader>3"] = ":lua require(\"harpoon.ui\").nav_file(3)<CR>"
lvim.keys.normal_mode["<leader>4"] = ":lua require(\"harpoon.ui\").nav_file(4)<CR>"

-- Fugitive
lvim.keys.normal_mode["<leader>gh"] = ":0Gclog<CR>"
