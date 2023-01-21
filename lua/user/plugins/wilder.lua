local wilder = require("wilder")
wilder.setup({ modes = { ":", "/", "?" } })
wilder.set_option(
  "renderer",
  wilder.renderer_mux({
    [":"] = wilder.popupmenu_renderer({
      highlighter = wilder.basic_highlighter(),
    }),
    ["/"] = wilder.wildmenu_renderer({
      highlighter = wilder.basic_highlighter(),
    }),
  })
)
vim.cmd([[ 
call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
      \ 'highlights': {
      \   'border': 'Normal',
      \ },
      \ 'pumblend': 20,
      \ 'border': 'rounded',
      \ })))
]])
