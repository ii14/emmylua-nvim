---@meta

function vim.fn.abs(expr) end
function vim.fn.acos(expr) end
function vim.fn.add(object, item) end
vim.fn["and"] = function(expr, expr) end
function vim.fn.append(lnum, text) end
function vim.fn.appendbufline(expr, lnum, text) end
function vim.fn.argc(winid) end
function vim.fn.arglistid(winnr, tabnr) end
function vim.fn.argv(nr, winid) end
function vim.fn.asin(expr) end
function vim.fn.assert_beeps(cmd) end
function vim.fn.assert_equal(exp, act, msg) end
function vim.fn.assert_equalfile(fname_one, fname_two, msg) end
function vim.fn.assert_exception(error, msg) end
function vim.fn.assert_fails(cmd, error) end
function vim.fn.assert_false(actual, msg) end
function vim.fn.assert_inrange(lower, upper, actual, msg) end
function vim.fn.assert_match(pat, text, msg) end
function vim.fn.assert_nobeep(cmd) end
function vim.fn.assert_notequal(exp, act, msg) end
function vim.fn.assert_notmatch(pat, text, msg) end
function vim.fn.assert_report(msg) end
function vim.fn.assert_true(actual, msg) end
function vim.fn.atan(expr) end
function vim.fn.atan2(expr1, expr2) end
function vim.fn.browse(save, title, initdir, default) end
function vim.fn.browsedir(title, initdir) end
function vim.fn.bufadd(name) end
function vim.fn.bufexists(expr) end
function vim.fn.buflisted(expr) end
function vim.fn.bufload(expr) end
function vim.fn.bufloaded(expr) end
function vim.fn.bufname(expr) end
function vim.fn.bufnr(expr, create) end
function vim.fn.bufwinid(expr) end
function vim.fn.bufwinnr(expr) end
function vim.fn.byte2line(byte) end
function vim.fn.byteidx(expr, nr) end
function vim.fn.byteidxcomp(expr, nr) end
function vim.fn.call(func, arglist, dict) end
function vim.fn.ceil(expr) end
function vim.fn.chanclose(id, stream) end
function vim.fn.chansend(id, data) end
function vim.fn.char2nr(expr, utf8) end
function vim.fn.charcol(expr) end
function vim.fn.charidx(string, idx, countcc) end
function vim.fn.chdir(dir) end
function vim.fn.cindent(lnum) end
function vim.fn.clearmatches(win) end
function vim.fn.col(expr) end
function vim.fn.complete(startcol, matches) end
function vim.fn.complete_add(expr) end
function vim.fn.complete_info(what) end
function vim.fn.confirm(msg, choices, default, type) end
function vim.fn.copy(expr) end
function vim.fn.cos(expr) end
function vim.fn.cosh(expr) end
function vim.fn.count(comp, expr, ic, start) end
function vim.fn.cscope_connection(num, dbpath, prepend) end
function vim.fn.ctxget(index) end
function vim.fn.ctxpush(types) end
function vim.fn.ctxset(context, index) end
function vim.fn.cursor(lnum, col, off) end
function vim.fn.cursor(list) end
function vim.fn.debugbreak(pid) end
function vim.fn.deepcopy(expr, noref) end
function vim.fn.delete(fname, flags) end
function vim.fn.deletebufline(buf, first, last) end
function vim.fn.dictwatcheradd(dict, pattern, callback) end
function vim.fn.dictwatcherdel(dict, pattern, callback) end
function vim.fn.diff_filler(lnum) end
function vim.fn.diff_hlID(lnum, col) end
function vim.fn.digraph_get(chars) end
function vim.fn.digraph_getlist(listall) end
function vim.fn.digraph_set(chars, digraph) end
function vim.fn.digraph_setlist(digraphlist) end
function vim.fn.empty(expr) end
function vim.fn.escape(string, chars) end
function vim.fn.eval(string) end
function vim.fn.executable(expr) end
function vim.fn.execute(command) end
function vim.fn.exepath(expr) end
function vim.fn.exists(expr) end
function vim.fn.extend(expr1, expr2, expr3) end
function vim.fn.exp(expr) end
function vim.fn.expand(expr, nosuf, list) end
function vim.fn.expandcmd(expr) end
function vim.fn.feedkeys(string, mode) end
function vim.fn.filereadable(file) end
function vim.fn.filewritable(file) end
function vim.fn.filter(expr1, expr2) end
function vim.fn.finddir(name, path, count) end
function vim.fn.findfile(name, path, count) end
function vim.fn.flatten(list, maxdepth) end
function vim.fn.float2nr(expr) end
function vim.fn.floor(expr) end
function vim.fn.fmod(expr1, expr2) end
function vim.fn.fnameescape(fname) end
function vim.fn.fnamemodify(fname, mods) end
function vim.fn.foldclosed(lnum) end
function vim.fn.foldclosedend(lnum) end
function vim.fn.foldlevel(lnum) end
function vim.fn.foldtextresult(lnum) end
function vim.fn.fullcommand(name) end
function vim.fn.funcref(name, arglist, dict) end
vim.fn["function"] = function(name, arglist, dict) end
function vim.fn.garbagecollect(atexit) end
function vim.fn.get(list, idx, def) end
function vim.fn.get(dict, key, def) end
function vim.fn.get(func, what) end
function vim.fn.getbufinfo(buf) end
function vim.fn.getbufline(buf, lnum, end_) end
function vim.fn.getbufvar(buf, varname, def) end
function vim.fn.getchangelist(buf) end
function vim.fn.getchar(expr) end
function vim.fn.getcharpos(expr) end
function vim.fn.getcharstr(expr) end
function vim.fn.getcompletion(pat, type, filtered) end
function vim.fn.getcurpos(winnr) end
function vim.fn.getcursorcharpos(winnr) end
function vim.fn.getcwd(winnr, tabnr) end
function vim.fn.getenv(name) end
function vim.fn.getfontname(name) end
function vim.fn.getfperm(fname) end
function vim.fn.getfsize(fname) end
function vim.fn.getftime(fname) end
function vim.fn.getftype(fname) end
function vim.fn.getjumplist(winnr, tabnr) end
function vim.fn.getline(lnum) end
function vim.fn.getline(lnum, end_) end
function vim.fn.getloclist(nr) end
function vim.fn.getloclist(nr, what) end
function vim.fn.getmarklist(buf) end
function vim.fn.getmatches(win) end
function vim.fn.getpos(expr) end
function vim.fn.getqflist(what) end
function vim.fn.getreginfo(regname) end
function vim.fn.getregtype(regname) end
function vim.fn.gettabinfo(expr) end
function vim.fn.gettabvar(nr, varname, def) end
function vim.fn.gettabwinvar(tabnr, winnr, name, def) end
function vim.fn.gettagstack(nr) end
function vim.fn.getwininfo(winid) end
function vim.fn.getwinpos(timeout) end
function vim.fn.getwinvar(nr, varname, def) end
function vim.fn.glob(expr, nosuf, list, alllinks) end
function vim.fn.glob2regpat(expr) end
function vim.fn.globpath(path, expr, nosuf, list, alllinks) end
function vim.fn.has(feature) end
function vim.fn.has_key(dict, key) end
function vim.fn.haslocaldir(winnr, tabnr) end
function vim.fn.hasmapto(what, mode, abbr) end
function vim.fn.histadd(history, item) end
function vim.fn.histdel(history, item) end
function vim.fn.histget(history, index) end
function vim.fn.histnr(history) end
function vim.fn.hlexists(name) end
function vim.fn.hlID(name) end
function vim.fn.iconv(expr, from, to) end
function vim.fn.indent(lnum) end
function vim.fn.index(object, expr, start, ic) end
function vim.fn.input(prompt, text, completion) end
function vim.fn.inputlist(textlist) end
function vim.fn.inputsecret(prompt, text) end
function vim.fn.insert(object, item, idx) end
function vim.fn.invert(expr) end
function vim.fn.isdirectory(directory) end
function vim.fn.isinf(expr) end
function vim.fn.islocked(expr) end
function vim.fn.isnan(expr) end
function vim.fn.id(expr) end
function vim.fn.items(dict) end
function vim.fn.jobpid(id) end
function vim.fn.jobresize(id, width, height) end
function vim.fn.jobstart(cmd, opts) end
function vim.fn.jobstop(id) end
function vim.fn.jobwait(ids, timeout) end
function vim.fn.join(list, sep) end
function vim.fn.json_decode(expr) end
function vim.fn.json_encode(expr) end
function vim.fn.keys(dict) end
function vim.fn.len(expr) end
function vim.fn.libcall(lib, func, arg) end
function vim.fn.libcallnr(lib, func, arg) end
function vim.fn.line(expr, winid) end
function vim.fn.line2byte(lnum) end
function vim.fn.lispindent(lnum) end
function vim.fn.list2str(list, utf8) end
function vim.fn.log(expr) end
function vim.fn.log10(expr) end
function vim.fn.luaeval(expr, expr) end
function vim.fn.map(expr1, expr2) end
function vim.fn.maparg(name, mode, abbr, dict) end
function vim.fn.mapcheck(name, mode, abbr) end
function vim.fn.match(expr, pat, start, count) end
function vim.fn.matchadd(group, pattern, priority, id, dict) end
function vim.fn.matchaddpos(group, pos, priority, id, dict) end
function vim.fn.matcharg(nr) end
function vim.fn.matchdelete(id, win) end
function vim.fn.matchend(expr, pat, start, count) end
function vim.fn.matchfuzzy(list, str, dict) end
function vim.fn.matchfuzzypos(list, str, dict) end
function vim.fn.matchlist(expr, pat, start, count) end
function vim.fn.matchstr(expr, pat, start, count) end
function vim.fn.matchstrpos(expr, pat, start, count) end
function vim.fn.max(expr) end
function vim.fn.menu_get(path, modes) end
function vim.fn.min(expr) end
function vim.fn.mkdir(name, path, prot) end
function vim.fn.mode(expr) end
function vim.fn.msgpackdump(list, type) end
function vim.fn.msgpackparse(data) end
function vim.fn.nextnonblank(lnum) end
function vim.fn.nr2char(expr, utf8) end
vim.fn["or"] = function(expr, expr) end
function vim.fn.pathshorten(expr, len) end
function vim.fn.perleval(expr) end
function vim.fn.pow(x, y) end
function vim.fn.prevnonblank(lnum) end
function vim.fn.printf(fmt, ...) end
function vim.fn.prompt_getprompt(buf) end
function vim.fn.prompt_setcallback(buf, expr) end
function vim.fn.prompt_setinterrupt(buf, text) end
function vim.fn.prompt_setprompt(buf, text) end
function vim.fn.pyeval(expr) end
function vim.fn.py3eval(expr) end
function vim.fn.pyxeval(expr) end
function vim.fn.rand(expr) end
function vim.fn.range(expr, max, stride) end
function vim.fn.readdir(dir, expr) end
function vim.fn.readfile(fname, type, max) end
function vim.fn.reduce(object, func, initial) end
function vim.fn.reltime(start, end_) end
function vim.fn.reltimefloat(time) end
function vim.fn.reltimestr(time) end
function vim.fn.remove(list, idx, end_) end
function vim.fn.remove(blob, idx, end_) end
function vim.fn.remove(dict, key) end
function vim.fn.rename(from, to) end
vim.fn["repeat"] = function(expr, count) end
function vim.fn.resolve(filename) end
function vim.fn.reverse(list) end
function vim.fn.round(expr) end
function vim.fn.rubyeval(expr) end
function vim.fn.rpcnotify(channel, event, ...) end
function vim.fn.rpcrequest(channel, method, ...) end
function vim.fn.screenattr(row, col) end
function vim.fn.screenchar(row, col) end
function vim.fn.screenchars(row, col) end
function vim.fn.screenpos(winid, lnum, col) end
function vim.fn.screenstring(row, col) end
function vim.fn.search(pattern, flags, stopline, timeout, skip) end
function vim.fn.searchcount(options) end
function vim.fn.searchdecl(name, global, thisblock) end
function vim.fn.searchpair(start, middle, end_, flags, ...) end
function vim.fn.searchpairpos(start, middle, end_, flags, ...) end
function vim.fn.searchpos(pattern, flags, stopline, timeout, skip) end
function vim.fn.setbufline(expr, lnum, text) end
function vim.fn.setbufvar(buf, varname, val) end
function vim.fn.setcharpos(expr, list) end
function vim.fn.setcharsearch(dict) end
function vim.fn.setcmdpos(pos) end
function vim.fn.setcursorcharpos(list) end
function vim.fn.setenv(name, val) end
function vim.fn.setline(lnum, line) end
function vim.fn.setloclist(nr, list, action) end
function vim.fn.setloclist(nr, list, action, what) end
function vim.fn.setmatches(list, win) end
function vim.fn.setpos(expr, list) end
function vim.fn.setqflist(list, action) end
function vim.fn.setqflist(list, action, what) end
function vim.fn.setreg(n, v, opt) end
function vim.fn.settabvar(nr, varname, val) end
function vim.fn.settabwinvar(tabnr, winnr, varname, val) end
function vim.fn.settagstack(nr, dict, action) end
function vim.fn.setwinvar(nr, varname, val) end
function vim.fn.sha256(string) end
function vim.fn.shellescape(string, special) end
function vim.fn.shiftwidth(col) end
function vim.fn.sign_define(name, dict) end
function vim.fn.sign_define(list) end
function vim.fn.sign_getdefined(name) end
function vim.fn.sign_getplaced(buf, dict) end
function vim.fn.sign_jump(id, group, buf) end
function vim.fn.sign_place(id, group, name, buf, dict) end
function vim.fn.sign_placelist(list) end
function vim.fn.sign_undefine(name) end
function vim.fn.sign_undefine(list) end
function vim.fn.sign_unplace(group, dict) end
function vim.fn.sign_unplacelist(list) end
function vim.fn.simplify(filename) end
function vim.fn.sin(expr) end
function vim.fn.sinh(expr) end
function vim.fn.sockconnect(mode, address, opts) end
function vim.fn.sort(list, func, dict) end
function vim.fn.soundfold(word) end
function vim.fn.spellsuggest(word, max, capital) end
function vim.fn.split(expr, pat, keepempty) end
function vim.fn.sqrt(expr) end
function vim.fn.srand(expr) end
function vim.fn.stdioopen(dict) end
function vim.fn.stdpath(what) end
function vim.fn.str2float(expr, quoted) end
function vim.fn.str2list(expr, utf8) end
function vim.fn.str2nr(expr, base, quoted) end
function vim.fn.strchars(expr, skipcc) end
function vim.fn.strcharpart(str, start, len) end
function vim.fn.strdisplaywidth(expr, col) end
function vim.fn.strftime(format, time) end
function vim.fn.strgetchar(str, index) end
function vim.fn.stridx(haystack, needle, start) end
function vim.fn.string(expr) end
function vim.fn.strlen(expr) end
function vim.fn.strpart(str, start, len, chars) end
function vim.fn.strptime(format, timestring) end
function vim.fn.strridx(haystack, needle, start) end
function vim.fn.strtrans(expr) end
function vim.fn.strwidth(expr) end
function vim.fn.submatch(nr, list) end
function vim.fn.substitute(expr, pat, sub, flags) end
function vim.fn.swapinfo(fname) end
function vim.fn.swapname(buf) end
function vim.fn.synID(lnum, col, trans) end
function vim.fn.synIDattr(synID, what, mode) end
function vim.fn.synIDtrans(synID) end
function vim.fn.synconcealed(lnum, col) end
function vim.fn.synstack(lnum, col) end
function vim.fn.system(cmd, input) end
function vim.fn.systemlist(cmd, input) end
function vim.fn.tabpagebuflist(arg) end
function vim.fn.tabpagenr(arg) end
function vim.fn.tabpagewinnr(tabarg, arg) end
function vim.fn.taglist(expr, filename) end
function vim.fn.tan(expr) end
function vim.fn.tanh(expr) end
function vim.fn.timer_info(id) end
function vim.fn.timer_pause(id, pause) end
function vim.fn.timer_start(time, callback, options) end
function vim.fn.timer_stop(timer) end
function vim.fn.tolower(expr) end
function vim.fn.toupper(expr) end
function vim.fn.tr(src, fromstr, tostr) end
function vim.fn.trim(text, mask, dir) end
function vim.fn.trunc(expr) end
function vim.fn.type(name) end
function vim.fn.undofile(name) end
function vim.fn.uniq(list, func, dict) end
function vim.fn.values(dict) end
function vim.fn.virtcol(expr) end
function vim.fn.visualmode(expr) end
function vim.fn.wait(timeout, condition, interval) end
function vim.fn.win_execute(id, command, silent) end
function vim.fn.win_findbuf(bufnr) end
function vim.fn.win_getid(win, tab) end
function vim.fn.win_gettype(nr) end
function vim.fn.win_gotoid(expr) end
function vim.fn.win_id2tabwin(expr) end
function vim.fn.win_id2win(expr) end
function vim.fn.win_move_separator(nr) end
function vim.fn.win_move_statusline(nr) end
function vim.fn.win_screenpos(nr) end
function vim.fn.win_splitmove(nr, target, options) end
function vim.fn.winbufnr(nr) end
function vim.fn.winheight(nr) end
function vim.fn.winlayout(tabnr) end
function vim.fn.winnr(expr) end
function vim.fn.winrestview(dict) end
function vim.fn.winwidth(nr) end
function vim.fn.writefile(object, fname, flags) end
function vim.fn.xor(expr, expr) end