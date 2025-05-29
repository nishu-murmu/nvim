return {
  'numToStr/Comment.nvim',
  event = 'BufReadPost',
  config = function()
    local status_ok, Comment = pcall(require, 'Comment')
    if not status_ok then
      return
    else
      Comment.setup()
    end
  end,
}
