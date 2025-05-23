return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      buffer_close_icon = "x",
      close_command = "bdelete %d",
      close_icon = "x",
      indicator = {
        style = "icon",
        icon = " ",
      },
      left_trunc_marker = "",
      modified_icon = "●",
      offsets = {
        {
          filetype = "snacks_layout_box",
          -- text = " ",
          text_align = "center",
        },
      },
      right_mouse_command = "bdelete! %d",
      right_trunc_marker = "",
      show_close_icon = false,
      show_tab_indicators = true,
    },
    highlights = {
      fill = {
        fg = { attribute = "fg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "StatusLineNC" },
      },
      background = {
        fg = { attribute = "fg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "StatusLine" },
      },
      buffer_visible = {
        fg = { attribute = "fg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "Normal" },
      },
      buffer_selected = {
        fg = { attribute = "fg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "Normal" },
        underline = true,
        sp = "#F37021",
      },
      separator = {
        fg = { attribute = "bg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "StatusLine" },
      },
      separator_selected = {
        fg = { attribute = "fg", highlight = "Special" },
        bg = { attribute = "bg", highlight = "Normal" },
      },
      separator_visible = {
        fg = { attribute = "fg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "StatusLineNC" },
      },
      close_button = {
        fg = { attribute = "fg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "StatusLine" },
      },
      close_button_selected = {
        fg = { attribute = "fg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "Normal" },
        underline = true,
        sp = "#F37021",
      },
      close_button_visible = {
        fg = { attribute = "fg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "Normal" },
      },
    },
  },
}
