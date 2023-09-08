-- Build script for "inconsolata-nerd-font" files

-- Identify the bundle and module
bundle = ""
module = "inconsolata-nerd-font"

-- Release a TDS-style zip
packtdszip = true

-- Typeset only the .tex files
typesetfile = {"*.tex"}

-- Sources files
sourcesfiles =
  {
    "inconsolata-nerd-font.dtx",
    "inconsolata-nerd-font.ins",
    "inconsolata-nerd-font.tex",
    "truetype/InconsolataNerdFont-Bold.ttf",
    "truetype/InconsolataNErdFont-Regular.ttf",
  }

installfiles = {"*.sty", "*.ttf"}

-- Use LuaLaTeX for compiling
typesetexe = "lualatex"