---@meta


---@return any
function vim.fn.abs(expr) end

---@return any
function vim.fn.acos(expr) end

---@return any
function vim.fn.add(object, item) end

---@return any
vim.fn["and"] = function(expr, expr) end

---@return any
function vim.fn.append(lnum, text) end

---@return any
function vim.fn.appendbufline(expr, lnum, text) end

---@return any
function vim.fn.argc(winid) end

---@return any
function vim.fn.arglistid(winnr, tabnr) end

---@return any
function vim.fn.argv(nr, winid) end

---@return any
function vim.fn.asin(expr) end

---@return any
function vim.fn.assert_beeps(cmd) end

---@return any
function vim.fn.assert_equal(exp, act, msg) end

---@return any
function vim.fn.assert_equalfile(fname_one, fname_two, msg) end

---@return any
function vim.fn.assert_exception(error, msg) end

---@return any
function vim.fn.assert_fails(cmd, error) end

---@return any
function vim.fn.assert_false(actual, msg) end

---@return any
function vim.fn.assert_inrange(lower, upper, actual, msg) end

---@return any
function vim.fn.assert_match(pat, text, msg) end

---@return any
function vim.fn.assert_nobeep(cmd) end

---@return any
function vim.fn.assert_notequal(exp, act, msg) end

---@return any
function vim.fn.assert_notmatch(pat, text, msg) end

---@return any
function vim.fn.assert_report(msg) end

---@return any
function vim.fn.assert_true(actual, msg) end

---@return any
function vim.fn.atan(expr) end

---@return any
function vim.fn.atan2(expr1, expr2) end

---@return any
function vim.fn.browse(save, title, initdir, default) end

---@return any
function vim.fn.browsedir(title, initdir) end

---@return any
function vim.fn.bufadd(name) end

---@return any
function vim.fn.bufexists(expr) end

---@return any
function vim.fn.buflisted(expr) end

---@return any
function vim.fn.bufload(expr) end

---@return any
function vim.fn.bufloaded(expr) end

---@return any
function vim.fn.bufname(expr) end

---@return any
function vim.fn.bufnr(expr, create) end

---@return any
function vim.fn.bufwinid(expr) end

---@return any
function vim.fn.bufwinnr(expr) end

---@return any
function vim.fn.byte2line(byte) end

---@return any
function vim.fn.byteidx(expr, nr) end

---@return any
function vim.fn.byteidxcomp(expr, nr) end

---@return any
function vim.fn.call(func, arglist, dict) end

---@return any
function vim.fn.ceil(expr) end

---@return any
function vim.fn.chanclose(id, stream) end

---@return any
function vim.fn.chansend(id, data) end

---@return any
function vim.fn.char2nr(expr, utf8) end

---@return any
function vim.fn.charcol(expr) end

---@return any
function vim.fn.charidx(string, idx, countcc) end

---@return any
function vim.fn.chdir(dir) end

---@return any
function vim.fn.cindent(lnum) end

---@return any
function vim.fn.clearmatches(win) end

---@return any
function vim.fn.col(expr) end

---@return any
function vim.fn.complete(startcol, matches) end

---@return any
function vim.fn.complete_add(expr) end

---@return any
function vim.fn.complete_info(what) end

---@return any
function vim.fn.confirm(msg, choices, default, type) end

---@return any
function vim.fn.copy(expr) end

---@return any
function vim.fn.cos(expr) end

---@return any
function vim.fn.cosh(expr) end

---@return any
function vim.fn.count(comp, expr, ic, start) end

---@return any
function vim.fn.cscope_connection(num, dbpath, prepend) end

---@return any
function vim.fn.ctxget(index) end

---@return any
function vim.fn.ctxpush(types) end

---@return any
function vim.fn.ctxset(context, index) end

---@return any
function vim.fn.cursor(lnum, col, off) end

---@return any
function vim.fn.cursor(list) end

---@return any
function vim.fn.debugbreak(pid) end

---@return any
function vim.fn.deepcopy(expr, noref) end

---@return any
function vim.fn.delete(fname, flags) end

---@return any
function vim.fn.deletebufline(buf, first, last) end

---@return any
function vim.fn.dictwatcheradd(dict, pattern, callback) end

---@return any
function vim.fn.dictwatcherdel(dict, pattern, callback) end

---@return any
function vim.fn.diff_filler(lnum) end

---@return any
function vim.fn.diff_hlID(lnum, col) end

---@return any
function vim.fn.digraph_get(chars) end

---@return any
function vim.fn.digraph_getlist(listall) end

---@return any
function vim.fn.digraph_set(chars, digraph) end

---@return any
function vim.fn.digraph_setlist(digraphlist) end

---@return any
function vim.fn.empty(expr) end

---@return any
function vim.fn.escape(string, chars) end

---@return any
function vim.fn.eval(string) end

---@return any
function vim.fn.executable(expr) end

---@return any
function vim.fn.execute(command) end

---@return any
function vim.fn.exepath(expr) end

---@return any
function vim.fn.exists(expr) end

---@return any
function vim.fn.extend(expr1, expr2, expr3) end

---@return any
function vim.fn.exp(expr) end

---@return any
function vim.fn.expand(expr, nosuf, list) end

---@return any
function vim.fn.expandcmd(expr) end

---@return any
function vim.fn.feedkeys(string, mode) end

---@return any
function vim.fn.filereadable(file) end

---@return any
function vim.fn.filewritable(file) end

---@return any
function vim.fn.filter(expr1, expr2) end

---@return any
function vim.fn.finddir(name, path, count) end

---@return any
function vim.fn.findfile(name, path, count) end

---@return any
function vim.fn.flatten(list, maxdepth) end

---@return any
function vim.fn.float2nr(expr) end

---@return any
function vim.fn.floor(expr) end

---@return any
function vim.fn.fmod(expr1, expr2) end

---@return any
function vim.fn.fnameescape(fname) end

---@return any
function vim.fn.fnamemodify(fname, mods) end

---@return any
function vim.fn.foldclosed(lnum) end

---@return any
function vim.fn.foldclosedend(lnum) end

---@return any
function vim.fn.foldlevel(lnum) end

---@return any
function vim.fn.foldtextresult(lnum) end

---@return any
function vim.fn.fullcommand(name) end

---@return any
function vim.fn.funcref(name, arglist, dict) end

---@return any
vim.fn["function"] = function(name, arglist, dict) end

---@return any
function vim.fn.garbagecollect(atexit) end

---@return any
function vim.fn.get(list, idx, def) end

---@return any
function vim.fn.get(dict, key, def) end

---@return any
function vim.fn.get(func, what) end

---@return any
function vim.fn.getbufinfo(buf) end

---@return any
function vim.fn.getbufline(buf, lnum, end_) end

---@return any
function vim.fn.getbufvar(buf, varname, def) end

---@return any
function vim.fn.getchangelist(buf) end

---@return any
function vim.fn.getchar(expr) end

---@return any
function vim.fn.getcharpos(expr) end

---@return any
function vim.fn.getcharstr(expr) end

---@return any
function vim.fn.getcompletion(pat, type, filtered) end

---@return any
function vim.fn.getcurpos(winnr) end

---@return any
function vim.fn.getcursorcharpos(winnr) end

---@return any
function vim.fn.getcwd(winnr, tabnr) end

---@return any
function vim.fn.getenv(name) end

---@return any
function vim.fn.getfontname(name) end

---@return any
function vim.fn.getfperm(fname) end

---@return any
function vim.fn.getfsize(fname) end

---@return any
function vim.fn.getftime(fname) end

---@return any
function vim.fn.getftype(fname) end

---@return any
function vim.fn.getjumplist(winnr, tabnr) end

---@return any
function vim.fn.getline(lnum) end

---@return any
function vim.fn.getline(lnum, end_) end

---@return any
function vim.fn.getloclist(nr) end

---@return any
function vim.fn.getloclist(nr, what) end

---@return any
function vim.fn.getmarklist(buf) end

---@return any
function vim.fn.getmatches(win) end

---@return any
function vim.fn.getpos(expr) end

---@return any
function vim.fn.getqflist(what) end

---@return any
function vim.fn.getreginfo(regname) end

---@return any
function vim.fn.getregtype(regname) end

---@return any
function vim.fn.gettabinfo(expr) end

---@return any
function vim.fn.gettabvar(nr, varname, def) end

---@return any
function vim.fn.gettabwinvar(tabnr, winnr, name, def) end

---@return any
function vim.fn.gettagstack(nr) end

---@return any
function vim.fn.getwininfo(winid) end

---@return any
function vim.fn.getwinpos(timeout) end

---@return any
function vim.fn.getwinvar(nr, varname, def) end

---@return any
function vim.fn.glob(expr, nosuf, list, alllinks) end

---@return any
function vim.fn.glob2regpat(expr) end

---@return any
function vim.fn.globpath(path, expr, nosuf, list, alllinks) end

---@return any
function vim.fn.has(feature) end

---@return any
function vim.fn.has_key(dict, key) end

---@return any
function vim.fn.haslocaldir(winnr, tabnr) end

---@return any
function vim.fn.hasmapto(what, mode, abbr) end

---@return any
function vim.fn.histadd(history, item) end

---@return any
function vim.fn.histdel(history, item) end

---@return any
function vim.fn.histget(history, index) end

---@return any
function vim.fn.histnr(history) end

---@return any
function vim.fn.hlexists(name) end

---@return any
function vim.fn.hlID(name) end

---@return any
function vim.fn.iconv(expr, from, to) end

---@return any
function vim.fn.indent(lnum) end

---@return any
function vim.fn.index(object, expr, start, ic) end

---@return any
function vim.fn.input(prompt, text, completion) end

---@return any
function vim.fn.inputlist(textlist) end

---@return any
function vim.fn.inputsecret(prompt, text) end

---@return any
function vim.fn.insert(object, item, idx) end

---@return any
function vim.fn.invert(expr) end

---@return any
function vim.fn.isdirectory(directory) end

---@return any
function vim.fn.isinf(expr) end

---@return any
function vim.fn.islocked(expr) end

---@return any
function vim.fn.isnan(expr) end

---@return any
function vim.fn.id(expr) end

---@return any
function vim.fn.items(dict) end

---@return any
function vim.fn.jobpid(id) end

---@return any
function vim.fn.jobresize(id, width, height) end

---@return any
function vim.fn.jobstart(cmd, opts) end

---@return any
function vim.fn.jobstop(id) end

---@return any
function vim.fn.jobwait(ids, timeout) end

---@return any
function vim.fn.join(list, sep) end

---@return any
function vim.fn.json_decode(expr) end

---@return any
function vim.fn.json_encode(expr) end

---@return any
function vim.fn.keys(dict) end

---@return any
function vim.fn.len(expr) end

---@return any
function vim.fn.libcall(lib, func, arg) end

---@return any
function vim.fn.libcallnr(lib, func, arg) end

---@return any
function vim.fn.line(expr, winid) end

---@return any
function vim.fn.line2byte(lnum) end

---@return any
function vim.fn.lispindent(lnum) end

---@return any
function vim.fn.list2str(list, utf8) end

---@return any
function vim.fn.log(expr) end

---@return any
function vim.fn.log10(expr) end

---@return any
function vim.fn.luaeval(expr, expr) end

---@return any
function vim.fn.map(expr1, expr2) end

---@return any
function vim.fn.maparg(name, mode, abbr, dict) end

---@return any
function vim.fn.mapcheck(name, mode, abbr) end

---@return any
function vim.fn.match(expr, pat, start, count) end

---@return any
function vim.fn.matchadd(group, pattern, priority, id, dict) end

---@return any
function vim.fn.matchaddpos(group, pos, priority, id, dict) end

---@return any
function vim.fn.matcharg(nr) end

---@return any
function vim.fn.matchdelete(id, win) end

---@return any
function vim.fn.matchend(expr, pat, start, count) end

---@return any
function vim.fn.matchfuzzy(list, str, dict) end

---@return any
function vim.fn.matchfuzzypos(list, str, dict) end

---@return any
function vim.fn.matchlist(expr, pat, start, count) end

---@return any
function vim.fn.matchstr(expr, pat, start, count) end

---@return any
function vim.fn.matchstrpos(expr, pat, start, count) end

---@return any
function vim.fn.max(expr) end

---@return any
function vim.fn.menu_get(path, modes) end

---@return any
function vim.fn.min(expr) end

---@return any
function vim.fn.mkdir(name, path, prot) end

---@return any
function vim.fn.mode(expr) end

---@return any
function vim.fn.msgpackdump(list, type) end

---@return any
function vim.fn.msgpackparse(data) end

---@return any
function vim.fn.nextnonblank(lnum) end

---@return any
function vim.fn.nr2char(expr, utf8) end

---@return any
vim.fn["or"] = function(expr, expr) end

---@return any
function vim.fn.pathshorten(expr, len) end

---@return any
function vim.fn.perleval(expr) end

---@return any
function vim.fn.pow(x, y) end

---@return any
function vim.fn.prevnonblank(lnum) end

---@return any
function vim.fn.printf(fmt, ...) end

---@return any
function vim.fn.prompt_getprompt(buf) end

---@return any
function vim.fn.prompt_setcallback(buf, expr) end

---@return any
function vim.fn.prompt_setinterrupt(buf, text) end

---@return any
function vim.fn.prompt_setprompt(buf, text) end

---@return any
function vim.fn.pyeval(expr) end

---@return any
function vim.fn.py3eval(expr) end

---@return any
function vim.fn.pyxeval(expr) end

---@return any
function vim.fn.rand(expr) end

---@return any
function vim.fn.range(expr, max, stride) end

---@return any
function vim.fn.readdir(dir, expr) end

---@return any
function vim.fn.readfile(fname, type, max) end

---@return any
function vim.fn.reduce(object, func, initial) end

---@return any
function vim.fn.reltime(start, end_) end

---@return any
function vim.fn.reltimefloat(time) end

---@return any
function vim.fn.reltimestr(time) end

---@return any
function vim.fn.remove(list, idx, end_) end

---@return any
function vim.fn.remove(blob, idx, end_) end

---@return any
function vim.fn.remove(dict, key) end

---@return any
function vim.fn.rename(from, to) end

---@return any
vim.fn["repeat"] = function(expr, count) end

---@return any
function vim.fn.resolve(filename) end

---@return any
function vim.fn.reverse(list) end

---@return any
function vim.fn.round(expr) end

---@return any
function vim.fn.rubyeval(expr) end

---@return any
function vim.fn.rpcnotify(channel, event, ...) end

---@return any
function vim.fn.rpcrequest(channel, method, ...) end

---@return any
function vim.fn.screenattr(row, col) end

---@return any
function vim.fn.screenchar(row, col) end

---@return any
function vim.fn.screenchars(row, col) end

---@return any
function vim.fn.screenpos(winid, lnum, col) end

---@return any
function vim.fn.screenstring(row, col) end

---@return any
function vim.fn.search(pattern, flags, stopline, timeout, skip) end

---@return any
function vim.fn.searchcount(options) end

---@return any
function vim.fn.searchdecl(name, global, thisblock) end

---@return any
function vim.fn.searchpair(start, middle, end_, flags, ...) end

---@return any
function vim.fn.searchpairpos(start, middle, end_, flags, ...) end

---@return any
function vim.fn.searchpos(pattern, flags, stopline, timeout, skip) end

---@return any
function vim.fn.setbufline(expr, lnum, text) end

---@return any
function vim.fn.setbufvar(buf, varname, val) end

---@return any
function vim.fn.setcharpos(expr, list) end

---@return any
function vim.fn.setcharsearch(dict) end

---@return any
function vim.fn.setcmdpos(pos) end

---@return any
function vim.fn.setcursorcharpos(list) end

---@return any
function vim.fn.setenv(name, val) end

---@return any
function vim.fn.setline(lnum, line) end

---@return any
function vim.fn.setloclist(nr, list, action) end

---@return any
function vim.fn.setloclist(nr, list, action, what) end

---@return any
function vim.fn.setmatches(list, win) end

---@return any
function vim.fn.setpos(expr, list) end

---@return any
function vim.fn.setqflist(list, action) end

---@return any
function vim.fn.setqflist(list, action, what) end

---@return any
function vim.fn.setreg(n, v, opt) end

---@return any
function vim.fn.settabvar(nr, varname, val) end

---@return any
function vim.fn.settabwinvar(tabnr, winnr, varname, val) end

---@return any
function vim.fn.settagstack(nr, dict, action) end

---@return any
function vim.fn.setwinvar(nr, varname, val) end

---@return any
function vim.fn.sha256(string) end

---@return any
function vim.fn.shellescape(string, special) end

---@return any
function vim.fn.shiftwidth(col) end

---@return any
function vim.fn.sign_define(name, dict) end

---@return any
function vim.fn.sign_define(list) end

---@return any
function vim.fn.sign_getdefined(name) end

---@return any
function vim.fn.sign_getplaced(buf, dict) end

---@return any
function vim.fn.sign_jump(id, group, buf) end

---@return any
function vim.fn.sign_place(id, group, name, buf, dict) end

---@return any
function vim.fn.sign_placelist(list) end

---@return any
function vim.fn.sign_undefine(name) end

---@return any
function vim.fn.sign_undefine(list) end

---@return any
function vim.fn.sign_unplace(group, dict) end

---@return any
function vim.fn.sign_unplacelist(list) end

---@return any
function vim.fn.simplify(filename) end

---@return any
function vim.fn.sin(expr) end

---@return any
function vim.fn.sinh(expr) end

---@return any
function vim.fn.sockconnect(mode, address, opts) end

---@return any
function vim.fn.sort(list, func, dict) end

---@return any
function vim.fn.soundfold(word) end

---@return any
function vim.fn.spellsuggest(word, max, capital) end

---@return any
function vim.fn.split(expr, pat, keepempty) end

---@return any
function vim.fn.sqrt(expr) end

---@return any
function vim.fn.srand(expr) end

---@return any
function vim.fn.stdioopen(dict) end

---@return any
function vim.fn.stdpath(what) end

---@return any
function vim.fn.str2float(expr, quoted) end

---@return any
function vim.fn.str2list(expr, utf8) end

---@return any
function vim.fn.str2nr(expr, base, quoted) end

---@return any
function vim.fn.strchars(expr, skipcc) end

---@return any
function vim.fn.strcharpart(str, start, len) end

---@return any
function vim.fn.strdisplaywidth(expr, col) end

---@return any
function vim.fn.strftime(format, time) end

---@return any
function vim.fn.strgetchar(str, index) end

---@return any
function vim.fn.stridx(haystack, needle, start) end

---@return any
function vim.fn.string(expr) end

---@return any
function vim.fn.strlen(expr) end

---@return any
function vim.fn.strpart(str, start, len, chars) end

---@return any
function vim.fn.strptime(format, timestring) end

---@return any
function vim.fn.strridx(haystack, needle, start) end

---@return any
function vim.fn.strtrans(expr) end

---@return any
function vim.fn.strwidth(expr) end

---@return any
function vim.fn.submatch(nr, list) end

---@return any
function vim.fn.substitute(expr, pat, sub, flags) end

---@return any
function vim.fn.swapinfo(fname) end

---@return any
function vim.fn.swapname(buf) end

---@return any
function vim.fn.synID(lnum, col, trans) end

---@return any
function vim.fn.synIDattr(synID, what, mode) end

---@return any
function vim.fn.synIDtrans(synID) end

---@return any
function vim.fn.synconcealed(lnum, col) end

---@return any
function vim.fn.synstack(lnum, col) end

---@return any
function vim.fn.system(cmd, input) end

---@return any
function vim.fn.systemlist(cmd, input) end

---@return any
function vim.fn.tabpagebuflist(arg) end

---@return any
function vim.fn.tabpagenr(arg) end

---@return any
function vim.fn.tabpagewinnr(tabarg, arg) end

---@return any
function vim.fn.taglist(expr, filename) end

---@return any
function vim.fn.tan(expr) end

---@return any
function vim.fn.tanh(expr) end

---@return any
function vim.fn.timer_info(id) end

---@return any
function vim.fn.timer_pause(id, pause) end

---@return any
function vim.fn.timer_start(time, callback, options) end

---@return any
function vim.fn.timer_stop(timer) end

---@return any
function vim.fn.tolower(expr) end

---@return any
function vim.fn.toupper(expr) end

---@return any
function vim.fn.tr(src, fromstr, tostr) end

---@return any
function vim.fn.trim(text, mask, dir) end

---@return any
function vim.fn.trunc(expr) end

---@return any
function vim.fn.type(name) end

---@return any
function vim.fn.undofile(name) end

---@return any
function vim.fn.uniq(list, func, dict) end

---@return any
function vim.fn.values(dict) end

---@return any
function vim.fn.virtcol(expr) end

---@return any
function vim.fn.visualmode(expr) end

---@return any
function vim.fn.wait(timeout, condition, interval) end

---@return any
function vim.fn.win_execute(id, command, silent) end

---@return any
function vim.fn.win_findbuf(bufnr) end

---@return any
function vim.fn.win_getid(win, tab) end

---@return any
function vim.fn.win_gettype(nr) end

---@return any
function vim.fn.win_gotoid(expr) end

---@return any
function vim.fn.win_id2tabwin(expr) end

---@return any
function vim.fn.win_id2win(expr) end

---@return any
function vim.fn.win_move_separator(nr) end

---@return any
function vim.fn.win_move_statusline(nr) end

---@return any
function vim.fn.win_screenpos(nr) end

---@return any
function vim.fn.win_splitmove(nr, target, options) end

---@return any
function vim.fn.winbufnr(nr) end

---@return any
function vim.fn.winheight(nr) end

---@return any
function vim.fn.winlayout(tabnr) end

---@return any
function vim.fn.winnr(expr) end

---@return any
function vim.fn.winrestview(dict) end

---@return any
function vim.fn.winwidth(nr) end

---@return any
function vim.fn.writefile(object, fname, flags) end

---@return any
function vim.fn.xor(expr, expr) end