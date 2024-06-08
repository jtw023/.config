" NOTE: Progress timer

let s:progress_icons = ['/', '—', '\', '|']
let s:progress_buffers = {}
let s:progress = {
      \ 'win': -1,
      \ 'outwin': -1,
      \ 'buf': -1,
      \ 'timer': -1,
      \ 'counter': 0,
      \ 'icon_counter': 0,
      \ }

function! s:progress_tick(progress, timer) abort
  let a:progress.counter += 100
  if a:progress.icon_counter > 3
    let a:progress.icon_counter = 0
  endif
  let secs = a:progress.counter * 0.001
  let minutes = string(floor(secs / 60))
  let formattedminutes = substitute(minutes, '\.0$', '', '')
  let seconds = string(((fmod(secs / 60, 1) * 60) / 100) * 100)
  if formattedminutes > 0
    if formattedminutes < 2
      if seconds < 10
        let content = ' '.s:progress_icons[a:progress.icon_counter].' Execute query ---- '.formattedminutes.' minute '.seconds.' seconds '
      else
        let content = ' '.s:progress_icons[a:progress.icon_counter].' Execute query --- '.formattedminutes.' minute '.seconds.' seconds '
      endif
    elseif formattedminutes < 10
      if seconds < 10
        let content = ' '.s:progress_icons[a:progress.icon_counter].' Execute query --- '.formattedminutes.' minutes '.seconds.' seconds '
      else
        let content = ' '.s:progress_icons[a:progress.icon_counter].' Execute query -- '.formattedminutes.' minutes '.seconds.' seconds '
      endif
    else
      if seconds < 10
        let content = ' '.s:progress_icons[a:progress.icon_counter].' Execute query -- '.formattedminutes.' minutes '.seconds.' seconds '
      else
        let content = ' '.s:progress_icons[a:progress.icon_counter].' Execute query - '.formattedminutes.' minutes '.seconds.' seconds '
      endif
    endif
  else
    if seconds < 10
      let content = ' '.s:progress_icons[a:progress.icon_counter].' Execute query ------------- '.seconds.' seconds'
    else
      let content = ' '.s:progress_icons[a:progress.icon_counter].' Execute query ------------ '.seconds.' seconds'
    endif
  endif
  if has('nvim')
    call nvim_buf_set_lines(a:progress.buf, 0, -1, v:false, [content])
  else
    call popup_settext(a:progress.win, content)
  endif
  let a:progress.icon_counter += 1
endfunction

function! s:progress_winpos(win)
  let pos = win_screenpos(a:win)
  return [
        \ pos[0] + (winheight(a:win) / 2),
        \ pos[1] + (winwidth(a:win) / 2) - (winwidth(a:win) / 5),
        \ ]
endfunction

function! s:progress_hide(...) abort
  let bufname = a:0 > 0 ? a:1 : bufname()
  let progress = get(s:progress_buffers, bufname, {})
  if empty(progress)
    return
  endif
  if has('nvim')
    silent! call nvim_win_close(progress.win, v:true)
  else
    silent! call popup_close(progress.win)
  endif
  silent! call timer_stop(progress.timer)
  unlet! s:progress_buffers[bufname]
  call s:progress_reset_positions()
endfunction

function! s:progress_reset_positions()
  for bprogress in values(s:progress_buffers)
    let win = bprogress.win
    let [row, col] = s:progress_winpos(bprogress.outwin)
    if has('nvim')
      call nvim_win_set_config(win, { 'relative': 'editor', 'row': row - 2, 'col': col })
    else
      call popup_move(win, { 'line': row, 'col': col })
    endif
  endfor
endfunction

function! s:progress_show_neovim(path) abort
  let bufname =  !empty(a:path) ? a:path : bufname()
  let outwin = win_getid(bufwinnr(bufname))
  let progress = copy(s:progress)
  let progress.outwin = outwin
  let progress.buf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(progress.buf, 0, -1, v:false, ['| Execute query -------------- 0.0 seconds'])
  let [row, col] = s:progress_winpos(outwin)
  let opts = {
        \ 'relative': 'editor',
        \ 'width': 43,
        \ 'height': 1,
        \ 'row': row - 2,
        \ 'col': col,
        \ 'focusable': v:false,
        \ 'style': 'minimal'
        \ }
  if has('nvim-0.5')
    let opts.border = 'rounded'
  endif
  let progress.win = nvim_open_win(progress.buf, v:false, opts)
  let progress.timer = timer_start(100, function('s:progress_tick', [progress]), { 'repeat': -1 })
  let s:progress_buffers[bufname] = progress
endfunction

function! s:progress_show(...)
  if has('nvim')
    call s:progress_show_neovim(get(a:, 1, ''))
  else
    call s:progress_show_vim(get(a:, 1, ''))
  endif
  call s:progress_reset_positions()
endfunction

if exists('*nvim_open_win')
  augroup dbui_async_queries_dbout
    autocmd!
    autocmd User DBQueryPre call s:progress_show()
    autocmd User DBQueryPost call s:progress_hide()
    autocmd User *DBExecutePre call s:progress_show(expand('<amatch>:h'))
    autocmd User *DBExecutePost call s:progress_hide(expand('<amatch>:h'))
  augroup END
endif
