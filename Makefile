gen:
	nvim --headless \
		-c 'so gen_vim.lua' \
		-c 'so gen_api.lua' \
		-c 'so gen_fn.lua' \
		-c 'so gen_opt.lua' \
		-c 'qa!'

.PHONY: gen
