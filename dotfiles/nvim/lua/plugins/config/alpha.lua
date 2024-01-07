local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	vim.notify("plugin " .. alpha .. " failed to start.")
	return
end

local status_ok_dashboard, dashboard = pcall(require, "alpha.themes.dashboard")
if not status_ok_dashboard then
	vim.notify("plugin " .. dashboard .. " failed to start.")
	return
end

dashboard.section.header.val = {
	[[          .-'''-.    OOO     ]],
	[[         /(.) (.)\  ( Y o    ]],
	[[        ;    O    ;  //      ]],
	[[         \ }---{ /;,//       ]],
	[[          '-...-' ;,'        ]],
	[[         ,.--U--.//          ]],
	[[        //.      )           ]],
	[[      ,|| '.___.'            ]],
	[[     o Y ) | || |            ]],
	[[      OOO _|~||~|_           ]],
	[[         (___)(___)          ]],
	[[                             ]],
}

dashboard.section.buttons.val = {
	dashboard.button("n", "  New file", ":ene <BAR><CR>"),
	dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
	dashboard.button("g", "  Search in files", ":Telescope live_grep<CR>"),
	dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
	dashboard.button("q", "󰅖  Quit", ":qa<CR>"),
}

alpha.setup(dashboard.opts)
