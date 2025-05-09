return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local colors = {
      red = "#ca1243",
      grey = "#a0a1a7",
      black = "#383a42",
      white = "#e1e1e1",
      light_green = "#83a598",
      orange = "#fe8019",
      green = "#8ec07c",
    }

    local theme = {
      normal = {
        a = { fg = colors.white, bg = "NONE" },
        b = { fg = colors.white, bg = "NONE" },
        c = { fg = colors.white, bg = "NONE" },
        z = { fg = colors.white, bg = "NONE" },
      },
      insert = { a = { fg = colors.white, bg = colors.light_green } },
      visual = { a = { fg = colors.white, bg = colors.orange } },
      replace = { a = { fg = colors.white, bg = colors.green } },
    }

    local empty = require("lualine.component"):extend()
    function empty:draw(default_highlight)
      self.status = ""
      self.applied_separator = ""
      self:apply_highlights(default_highlight)
      self:apply_section_separators()
      return self.status
    end

    -- Put proper separators and gaps between components in sections
    local function process_sections(sections)
      for name, section in pairs(sections) do
        local left = name:sub(9, 10) < "x"
        for pos = 1, name ~= "lualine_z" and #section or #section - 1 do
          table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.white } })
        end
        for id, comp in ipairs(section) do
          if type(comp) ~= "table" then
            comp = { comp }
            section[id] = comp
          end
          comp.separator = left and { right = "" } or { left = "" }
        end
      end
      return sections
    end

    local function search_result()
      if vim.v.hlsearch == 0 then
        return ""
      end
      local last_search = vim.fn.getreg("/")
      if not last_search or last_search == "" then
        return ""
      end
      local searchcount = vim.fn.searchcount({ maxcount = 9999 })
      return last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ")"
    end

    local function modified()
      if vim.bo.modified then
        return "+"
      elseif vim.bo.modifiable == false or vim.bo.readonly == true then
        return "-"
      end
      return ""
    end

    require("lualine").setup({
      options = {
        theme = "vscode",
        component_separators = "",
        section_separators = { left = "", right = "" },
      },
      sections = process_sections({
        lualine_a = { "mode" },
        lualine_b = {
          "branch",
          "diff",
          {
            "diagnostics",
            source = { "nvim" },
            sections = { "error" },
            diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
          },
          {
            "diagnostics",
            source = { "nvim" },
            sections = { "warn" },
            diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
          },
          { "filename", file_status = false, path = 1 },
          { modified, color = { bg = colors.red } },
          {
            "%w",
            cond = function()
              return vim.wo.previewwindow
            end,
          },
          {
            "%r",
            cond = function()
              return vim.bo.readonly
            end,
          },
          {
            "%q",
            cond = function()
              return vim.bo.buftype == "quickfix"
            end,
          },
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { search_result, "filetype" },
        lualine_z = { "%p%%/%L", "%l:%c" },
      }),
      inactive_sections = {
        lualine_c = { "%f %y %m" },
        lualine_x = {},
      },
    })
    lualine.setup(config)
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = "#888888" })
  end,
}
