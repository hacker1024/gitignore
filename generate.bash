#!/bin/bash

function line_break {
  echo "" >> .gitignore
}

function append_github_global {
  echo "# -- $2 --" >> .gitignore
  curl -s https://raw.githubusercontent.com/github/gitignore/master/Global/$1.gitignore >> .gitignore
  echo "Appended $2."
}

> .gitignore
append_github_global 'macOS' 'macOS'
line_break
append_github_global 'Linux' 'Linux'
line_break
append_github_global 'Windows' 'Windows'
line_break
append_github_global 'JetBrains' 'JetBrains IDEs'
line_break
append_github_global 'VisualStudioCode' 'Visual Studio Code'
line_break
append_github_global 'Xcode' 'Xcode'
