-- Build script for "inconsolata-nerd-font" files

-- Identify the bundle and module
bundle = ""
module = "inconsolata-nerd-font"

-- Typeset only the .tex files
typesetfile = {"*.tex"}

-- Shorten the tagging list
tagfiles = { "CHANGELOG.md", "inconsolata-nerd-font.dtx" }

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

-- Detail how to set the version automatically
function update_tag(file, content, tagname, tagdate)
  tagname = string.gsub(tagname, "^v", "")

  if string.match(file, "CHANGELOG.md") then
    -- CHANGELOG
    local pattern = "v%d%.%d"
    local url = "https://github.com/stephanlukasczyk/inconsolata-nerd-font/compare/"
    local previous = string.match(content, "compare/(" .. pattern .. ")%.%.%.HEAD")
    if tagname == previous then return content end
    content = string.gsub(content,
      "## %[Unreleased%]",
      "## [Unreleased]\n\n## [v" .. tagname .. "] — " .. tagdate)
    return string.gsub(content,
      pattern .. "%.%.HEAD",
      "v" .. tagname .. "...HEAD\n[v" .. tagname .. "]: " .. url .. previous
      .. "...v" .. tagname)
  else
    -- inconsolata-nerd-font.dtx
    return string.gsub(content,
      "\n\\ProvidesExplPackage %{inconsolata%-nerd%-font%} %{[^}]+%} %{[^}]+%}\n",
      "\n\\ProvidesExplPackage {inconsolata-nerd-font} {"
      .. tagdate .. "} {" .. tagname .. "}\n")
  end
end

function tag_hook(tagname)
  os.execute('git commit -a -S -m "Release inconsolata-nerd-font ' .. tagname .. '"')
  os.execute('git tag -s -m "" ' .. tagname)
end
