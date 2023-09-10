-- Build script for "inconsolata-nerd-font" files

-- Identify the bundle and module
bundle = ""
module = "inconsolata-nerd-font"

-- Typeset only the .tex files
typesetfile = {"*.tex"}

-- Sources files
sourcefiles =
  {
    "inconsolata-nerd-font.dtx",
    "inconsolata-nerd-font.ins",
    "nerd-fonts/patched-fonts/Inconsolata/*.ttf",
  }

tdslocations =
{
  "fonts/truetype/" .. module .. "/" .. "*.ttf"
}

installfiles = {"*.sty", "*.ttf"}

-- Use LuaLaTeX for compiling
typesetexe = "lualatex"