local status_ok, tags = pcall(require, "nvim-ts-autotags")
if not status_ok then
  return
end

tags.setup()
