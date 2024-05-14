---@meta

---@class vim.api
vim.api = {}

---@alias Buffer integer
---@alias Tabpage integer
---@alias Window integer


---@param buffer Buffer
---@param ns_id integer
---@param hl_group string
---@param line integer
---@param col_start integer
---@param col_end integer
---@return integer
function vim.api.nvim_buf_add_highlight(buffer, ns_id, hl_group, line, col_start, col_end) end

---@param buffer Buffer
---@param send_buffer boolean
---@param opts table
---@return boolean
function vim.api.nvim_buf_attach(buffer, send_buffer, opts) end

---@param buffer Buffer
---@param fun function
---@return any
function vim.api.nvim_buf_call(buffer, fun) end

---@param buffer Buffer
---@param ns_id integer
---@param line_start integer
---@param line_end integer
function vim.api.nvim_buf_clear_highlight(buffer, ns_id, line_start, line_end) end

---@param buffer Buffer
---@param ns_id integer
---@param line_start integer
---@param line_end integer
function vim.api.nvim_buf_clear_namespace(buffer, ns_id, line_start, line_end) end

---@param buffer Buffer
---@param name string
---@param command any
---@param opts table
function vim.api.nvim_buf_create_user_command(buffer, name, command, opts) end

---@param buffer Buffer
---@param ns_id integer
---@param id integer
---@return boolean
function vim.api.nvim_buf_del_extmark(buffer, ns_id, id) end

---@param buffer Buffer
---@param mode string
---@param lhs string
function vim.api.nvim_buf_del_keymap(buffer, mode, lhs) end

---@param buffer Buffer
---@param name string
---@return boolean
function vim.api.nvim_buf_del_mark(buffer, name) end

---@param buffer Buffer
---@param name string
function vim.api.nvim_buf_del_user_command(buffer, name) end

---@param buffer Buffer
---@param name string
function vim.api.nvim_buf_del_var(buffer, name) end

---@param buffer Buffer
---@param opts table
function vim.api.nvim_buf_delete(buffer, opts) end

---@param buffer Buffer
---@return boolean
function vim.api.nvim_buf_detach(buffer) end

---@param buffer Buffer
---@return integer
function vim.api.nvim_buf_get_changedtick(buffer) end

---@param buffer Buffer
---@param opts table
---@return table
function vim.api.nvim_buf_get_commands(buffer, opts) end

---@param buffer Buffer
---@param ns_id integer
---@param id integer
---@param opts table
---@return integer[]
function vim.api.nvim_buf_get_extmark_by_id(buffer, ns_id, id, opts) end

---@param buffer Buffer
---@param ns_id integer
---@param start any
---@param _end any
---@param opts table
---@return table
function vim.api.nvim_buf_get_extmarks(buffer, ns_id, start, _end, opts) end

---@param buffer Buffer
---@param mode string
---@return table[]
function vim.api.nvim_buf_get_keymap(buffer, mode) end

---@param buffer Buffer
---@param start integer
---@param _end integer
---@param strict_indexing boolean
---@return string[]
function vim.api.nvim_buf_get_lines(buffer, start, _end, strict_indexing) end

---@param buffer Buffer
---@param name string
---@return { [1]: integer, [2]: integer }
function vim.api.nvim_buf_get_mark(buffer, name) end

---@param buffer Buffer
---@return string
function vim.api.nvim_buf_get_name(buffer) end

---@param buffer Buffer
---@return integer
function vim.api.nvim_buf_get_number(buffer) end

---@param buffer Buffer
---@param index integer
---@return integer
function vim.api.nvim_buf_get_offset(buffer, index) end

---@param buffer Buffer
---@param name string
---@return any
function vim.api.nvim_buf_get_option(buffer, name) end

---@param buffer Buffer
---@param start_row integer
---@param start_col integer
---@param end_row integer
---@param end_col integer
---@param opts table
---@return string[]
function vim.api.nvim_buf_get_text(buffer, start_row, start_col, end_row, end_col, opts) end

---@param buffer Buffer
---@param name string
---@return any
function vim.api.nvim_buf_get_var(buffer, name) end

---@param buffer Buffer
---@return boolean
function vim.api.nvim_buf_is_loaded(buffer) end

---@param buffer Buffer
---@return boolean
function vim.api.nvim_buf_is_valid(buffer) end

---@param buffer Buffer
---@return integer
function vim.api.nvim_buf_line_count(buffer) end

---@param buffer Buffer
---@param ns_id integer
---@param line integer
---@param col integer
---@param opts table
---@return integer
function vim.api.nvim_buf_set_extmark(buffer, ns_id, line, col, opts) end

---@param buffer Buffer
---@param mode string
---@param lhs string
---@param rhs string
---@param opts table
function vim.api.nvim_buf_set_keymap(buffer, mode, lhs, rhs, opts) end

---@param buffer Buffer
---@param start integer
---@param _end integer
---@param strict_indexing boolean
---@param replacement string[]
function vim.api.nvim_buf_set_lines(buffer, start, _end, strict_indexing, replacement) end

---@param buffer Buffer
---@param name string
---@param line integer
---@param col integer
---@param opts table
---@return boolean
function vim.api.nvim_buf_set_mark(buffer, name, line, col, opts) end

---@param buffer Buffer
---@param name string
function vim.api.nvim_buf_set_name(buffer, name) end

---@param buffer Buffer
---@param name string
---@param value any
function vim.api.nvim_buf_set_option(buffer, name, value) end

---@param buffer Buffer
---@param start_row integer
---@param start_col integer
---@param end_row integer
---@param end_col integer
---@param replacement string[]
function vim.api.nvim_buf_set_text(buffer, start_row, start_col, end_row, end_col, replacement) end

---@param buffer Buffer
---@param name string
---@param value any
function vim.api.nvim_buf_set_var(buffer, name, value) end

---@param buffer Buffer
---@param src_id integer
---@param line integer
---@param chunks table
---@param opts table
---@return integer
function vim.api.nvim_buf_set_virtual_text(buffer, src_id, line, chunks, opts) end

---@param calls table
---@return table
function vim.api.nvim_call_atomic(calls) end

---@param dict any
---@param fn string
---@param args table
---@return any
function vim.api.nvim_call_dict_function(dict, fn, args) end

---@param fn string
---@param args table
---@return any
function vim.api.nvim_call_function(fn, args) end

---@param chan integer
---@param data string
function vim.api.nvim_chan_send(chan, data) end

---@param opts table
function vim.api.nvim_clear_autocmds(opts) end

---@param cmd table
---@param opts table
---@return string
function vim.api.nvim_cmd(cmd, opts) end

---@param command string
function vim.api.nvim_command(command) end

---@param command string
---@return string
function vim.api.nvim_command_output(command) end

---@param name string
---@param opts table
---@return integer
function vim.api.nvim_create_augroup(name, opts) end

---@param event any
---@param opts table
---@return integer
function vim.api.nvim_create_autocmd(event, opts) end

---@param listed boolean
---@param scratch boolean
---@return Buffer
function vim.api.nvim_create_buf(listed, scratch) end

---@param name string
---@return integer
function vim.api.nvim_create_namespace(name) end

---@param name string
---@param command any
---@param opts table
function vim.api.nvim_create_user_command(name, command, opts) end

---@param id integer
function vim.api.nvim_del_augroup_by_id(id) end

---@param name string
function vim.api.nvim_del_augroup_by_name(name) end

---@param id integer
function vim.api.nvim_del_autocmd(id) end

function vim.api.nvim_del_current_line() end

---@param mode string
---@param lhs string
function vim.api.nvim_del_keymap(mode, lhs) end

---@param name string
---@return boolean
function vim.api.nvim_del_mark(name) end

---@param name string
function vim.api.nvim_del_user_command(name) end

---@param name string
function vim.api.nvim_del_var(name) end

---@param chunks table
---@param history boolean
---@param opts table
function vim.api.nvim_echo(chunks, history, opts) end

---@param str string
function vim.api.nvim_err_write(str) end

---@param str string
function vim.api.nvim_err_writeln(str) end

---@param expr string
---@return any
function vim.api.nvim_eval(expr) end

---@param str string
---@param opts table
---@return table
function vim.api.nvim_eval_statusline(str, opts) end

---@param src string
---@param output boolean
---@return string
function vim.api.nvim_exec(src, output) end

---@param src string
---@param opts table
---@return table
function vim.api.nvim_exec2(src, opts) end

---@param event any
---@param opts table
function vim.api.nvim_exec_autocmds(event, opts) end

---@param code string
---@param args table
---@return any
function vim.api.nvim_exec_lua(code, args) end

---@param code string
---@param args table
---@return any
function vim.api.nvim_execute_lua(code, args) end

---@param keys string
---@param mode string
---@param escape_ks boolean
function vim.api.nvim_feedkeys(keys, mode, escape_ks) end

---@return table
function vim.api.nvim_get_all_options_info() end

---@return table
function vim.api.nvim_get_api_info() end

---@param opts table
---@return table
function vim.api.nvim_get_autocmds(opts) end

---@param chan integer
---@return table
function vim.api.nvim_get_chan_info(chan) end

---@param name string
---@return integer
function vim.api.nvim_get_color_by_name(name) end

---@return table
function vim.api.nvim_get_color_map() end

---@param opts table
---@return table
function vim.api.nvim_get_commands(opts) end

---@param opts table
---@return table
function vim.api.nvim_get_context(opts) end

---@return Buffer
function vim.api.nvim_get_current_buf() end

---@return string
function vim.api.nvim_get_current_line() end

---@return Tabpage
function vim.api.nvim_get_current_tabpage() end

---@return Window
function vim.api.nvim_get_current_win() end

---@param ns_id integer
---@param opts table
---@return table
function vim.api.nvim_get_hl(ns_id, opts) end

---@param hl_id integer
---@param rgb boolean
---@return table
function vim.api.nvim_get_hl_by_id(hl_id, rgb) end

---@param name string
---@param rgb boolean
---@return table
function vim.api.nvim_get_hl_by_name(name, rgb) end

---@param name string
---@return integer
function vim.api.nvim_get_hl_id_by_name(name) end

---@param opts table
---@return integer
function vim.api.nvim_get_hl_ns(opts) end

---@param mode string
---@return table[]
function vim.api.nvim_get_keymap(mode) end

---@param name string
---@param opts table
---@return table
function vim.api.nvim_get_mark(name, opts) end

---@return table
function vim.api.nvim_get_mode() end

---@return table
function vim.api.nvim_get_namespaces() end

---@param name string
---@return any
function vim.api.nvim_get_option(name) end

---@param name string
---@return table
function vim.api.nvim_get_option_info(name) end

---@param name string
---@param opts table
---@return table
function vim.api.nvim_get_option_info2(name, opts) end

---@param name string
---@param opts table
---@return any
function vim.api.nvim_get_option_value(name, opts) end

---@param pid integer
---@return any
function vim.api.nvim_get_proc(pid) end

---@param pid integer
---@return table
function vim.api.nvim_get_proc_children(pid) end

---@param name string
---@param all boolean
---@return string[]
function vim.api.nvim_get_runtime_file(name, all) end

---@param name string
---@return any
function vim.api.nvim_get_var(name) end

---@param name string
---@return any
function vim.api.nvim_get_vvar(name) end

---@param keys string
---@return integer
function vim.api.nvim_input(keys) end

---@param button string
---@param action string
---@param modifier string
---@param grid integer
---@param row integer
---@param col integer
function vim.api.nvim_input_mouse(button, action, modifier, grid, row, col) end

---@return Buffer[]
function vim.api.nvim_list_bufs() end

---@return table
function vim.api.nvim_list_chans() end

---@return string[]
function vim.api.nvim_list_runtime_paths() end

---@return Tabpage[]
function vim.api.nvim_list_tabpages() end

---@return table
function vim.api.nvim_list_uis() end

---@return Window[]
function vim.api.nvim_list_wins() end

---@param dict table
---@return any
function vim.api.nvim_load_context(dict) end

---@param msg string
---@param log_level integer
---@param opts table
---@return any
function vim.api.nvim_notify(msg, log_level, opts) end

---@param buffer Buffer
---@param opts table
---@return integer
function vim.api.nvim_open_term(buffer, opts) end

---@param buffer Buffer
---@param enter boolean
---@param config table
---@return Window
function vim.api.nvim_open_win(buffer, enter, config) end

---@param str string
function vim.api.nvim_out_write(str) end

---@param str string
---@param opts table
---@return table
function vim.api.nvim_parse_cmd(str, opts) end

---@param expr string
---@param flags string
---@param highlight boolean
---@return table
function vim.api.nvim_parse_expression(expr, flags, highlight) end

---@param data string
---@param crlf boolean
---@param phase integer
---@return boolean
function vim.api.nvim_paste(data, crlf, phase) end

---@param lines string[]
---@param type string
---@param after boolean
---@param follow boolean
function vim.api.nvim_put(lines, type, after, follow) end

---@param str string
---@param from_part boolean
---@param do_lt boolean
---@param special boolean
---@return string
function vim.api.nvim_replace_termcodes(str, from_part, do_lt, special) end

---@param item integer
---@param insert boolean
---@param finish boolean
---@param opts table
function vim.api.nvim_select_popupmenu_item(item, insert, finish, opts) end

---@param name string
---@param version table
---@param type string
---@param methods table
---@param attributes table
function vim.api.nvim_set_client_info(name, version, type, methods, attributes) end

---@param buffer Buffer
function vim.api.nvim_set_current_buf(buffer) end

---@param dir string
function vim.api.nvim_set_current_dir(dir) end

---@param line string
function vim.api.nvim_set_current_line(line) end

---@param tabpage Tabpage
function vim.api.nvim_set_current_tabpage(tabpage) end

---@param window Window
function vim.api.nvim_set_current_win(window) end

---@param ns_id integer
---@param opts table
function vim.api.nvim_set_decoration_provider(ns_id, opts) end

---@param ns_id integer
---@param name string
---@param val table
function vim.api.nvim_set_hl(ns_id, name, val) end

---@param ns_id integer
function vim.api.nvim_set_hl_ns(ns_id) end

---@param ns_id integer
function vim.api.nvim_set_hl_ns_fast(ns_id) end

---@param mode string
---@param lhs string
---@param rhs string
---@param opts table
function vim.api.nvim_set_keymap(mode, lhs, rhs, opts) end

---@param name string
---@param value any
function vim.api.nvim_set_option(name, value) end

---@param name string
---@param value any
---@param opts table
function vim.api.nvim_set_option_value(name, value, opts) end

---@param name string
---@param value any
function vim.api.nvim_set_var(name, value) end

---@param name string
---@param value any
function vim.api.nvim_set_vvar(name, value) end

---@param text string
---@return integer
function vim.api.nvim_strwidth(text) end

---@param event string
function vim.api.nvim_subscribe(event) end

---@param tabpage Tabpage
---@param name string
function vim.api.nvim_tabpage_del_var(tabpage, name) end

---@param tabpage Tabpage
---@return integer
function vim.api.nvim_tabpage_get_number(tabpage) end

---@param tabpage Tabpage
---@param name string
---@return any
function vim.api.nvim_tabpage_get_var(tabpage, name) end

---@param tabpage Tabpage
---@return Window
function vim.api.nvim_tabpage_get_win(tabpage) end

---@param tabpage Tabpage
---@return boolean
function vim.api.nvim_tabpage_is_valid(tabpage) end

---@param tabpage Tabpage
---@return Window[]
function vim.api.nvim_tabpage_list_wins(tabpage) end

---@param tabpage Tabpage
---@param name string
---@param value any
function vim.api.nvim_tabpage_set_var(tabpage, name, value) end

---@param tabpage Tabpage
---@param win Window
function vim.api.nvim_tabpage_set_win(tabpage, win) end

---@param width integer
---@param height integer
---@param options table
function vim.api.nvim_ui_attach(width, height, options) end

function vim.api.nvim_ui_detach() end

---@param width number
---@param height number
---@param row number
---@param col number
function vim.api.nvim_ui_pum_set_bounds(width, height, row, col) end

---@param height integer
function vim.api.nvim_ui_pum_set_height(height) end

---@param gained boolean
function vim.api.nvim_ui_set_focus(gained) end

---@param name string
---@param value any
function vim.api.nvim_ui_set_option(name, value) end

---@param event string
---@param value any
function vim.api.nvim_ui_term_event(event, value) end

---@param width integer
---@param height integer
function vim.api.nvim_ui_try_resize(width, height) end

---@param grid integer
---@param width integer
---@param height integer
function vim.api.nvim_ui_try_resize_grid(grid, width, height) end

---@param event string
function vim.api.nvim_unsubscribe(event) end

---@param window Window
---@param fun function
---@return any
function vim.api.nvim_win_call(window, fun) end

---@param window Window
---@param force boolean
function vim.api.nvim_win_close(window, force) end

---@param window Window
---@param name string
function vim.api.nvim_win_del_var(window, name) end

---@param window Window
---@return Buffer
function vim.api.nvim_win_get_buf(window) end

---@param window Window
---@return table
function vim.api.nvim_win_get_config(window) end

---@param window Window
---@return { [1]: integer, [2]: integer }
function vim.api.nvim_win_get_cursor(window) end

---@param window Window
---@return integer
function vim.api.nvim_win_get_height(window) end

---@param window Window
---@return integer
function vim.api.nvim_win_get_number(window) end

---@param window Window
---@param name string
---@return any
function vim.api.nvim_win_get_option(window, name) end

---@param window Window
---@return { [1]: integer, [2]: integer }
function vim.api.nvim_win_get_position(window) end

---@param window Window
---@return Tabpage
function vim.api.nvim_win_get_tabpage(window) end

---@param window Window
---@param name string
---@return any
function vim.api.nvim_win_get_var(window, name) end

---@param window Window
---@return integer
function vim.api.nvim_win_get_width(window) end

---@param window Window
function vim.api.nvim_win_hide(window) end

---@param window Window
---@return boolean
function vim.api.nvim_win_is_valid(window) end

---@param window Window
---@param buffer Buffer
function vim.api.nvim_win_set_buf(window, buffer) end

---@param window Window
---@param config table
function vim.api.nvim_win_set_config(window, config) end

---@param window Window
---@param pos { [1]: integer, [2]: integer }
function vim.api.nvim_win_set_cursor(window, pos) end

---@param window Window
---@param height integer
function vim.api.nvim_win_set_height(window, height) end

---@param window Window
---@param ns_id integer
function vim.api.nvim_win_set_hl_ns(window, ns_id) end

---@param window Window
---@param name string
---@param value any
function vim.api.nvim_win_set_option(window, name, value) end

---@param window Window
---@param name string
---@param value any
function vim.api.nvim_win_set_var(window, name, value) end

---@param window Window
---@param width integer
function vim.api.nvim_win_set_width(window, width) end

---@param window Window
---@param opts table
---@return table
function vim.api.nvim_win_text_height(window, opts) end
