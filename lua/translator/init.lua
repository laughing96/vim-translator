local M = {}

function M.setup()
  local handle = io.popen("python3 -c 'from gtts import gTTS' 2>&1")
  local result = handle:read("*a")
  handle:close()

  if result:match("ModuleNotFoundError") then
    vim.notify("Installing gTTS for Anki save feature...", vim.log.levels.INFO)
    os.execute("pip3 install gTTS -q")
    vim.notify("gTTS installed successfully!", vim.log.levels.INFO)
  end
end

return M