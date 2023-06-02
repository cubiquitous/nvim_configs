local color_table = {
	rose_pine = "rose_pine",
	embark = "embark",
	gloombuddy = "gloombuddy",
	oxocarbon = "nyoom-engineering/oxocarbon.nvim",
	onedark = "navarasu/onedark.nvim",
	oceanic = "mhartington/oceanic-next",
	zephyr = "glepnir/zephyr-nvim",
	omni = "yonlu/omni.vim",
	pinkmare = "matsuuu/pinkmare",
	nightfox = "EdenEast/nightfox.nvim",
	nord = "shaunsingh/nord.nvim",
	kanagawa = "rebelot/kanagawa.nvim",
	iceberg = "cocopon/iceberg.vim",
	rocket = "AlanWarren/rocket",
	base2 = "atelierbram/Base2Tone-nvim",
	palenight = "drewtempelmeyer/palenight.vim",
}

return function(theme)
	local path_generator = require("user.utils.path").path_generator
	local colorscheme = path_generator("user/colorschemes/")
	return colorscheme(color_table[theme])
end
