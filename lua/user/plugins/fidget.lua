return {
  'j-hui/fidget.nvim',
  event = 'BufReadPost',
  config = function()
    local status_ok, fidget = pcall(require, 'fidget')
    if not status_ok then
      return
    end
    fidget.setup({
      progress = {
        poll_rate = 0,
        suppress_on_insert = false,
        ignore_done_already = false,
        ignore_empty_message = false,
        clear_on_detach = function(client_id)
          local client = vim.lsp.get_client_by_id(client_id)
          return client and client.name or nil
        end,
        notification_group = function(msg)
          return msg.lsp_client.name
        end,
        ignore = {},
        display = {
          render_limit = 16,
          done_ttl = 3,
          done_icon = '✔',
          done_style = 'Constant',
          progress_ttl = math.huge,
          progress_icon = { pattern = 'moon', period = 1 },
          progress_style = 'WarningMsg',
          group_style = 'Title',
          icon_style = 'Question',
          priority = 30,
          skip_history = true,
          format_annote = function(msg)
            return msg.title
          end,
          format_group_name = function(group)
            return tostring(group)
          end,
          overrides = {
            rust_analyzer = { name = 'rust-analyzer' },
          },
        },
        lsp = {
          progress_ringbuf_size = 0,
          log_handler = false,
        },
      },
      integration = {
        ['nvim-tree'] = {
          enable = true,
        },
        ['xcodebuild-nvim'] = {
          enable = true,
        },
      },
      logger = {
        level = vim.log.levels.WARN,
        max_size = 10000,
        float_precision = 0.01,
        path = string.format('%s/fidget.nvim.log', vim.fn.stdpath('cache')),
      },
    })
  end,
}
