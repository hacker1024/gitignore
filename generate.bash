#!/bin/bash

function append_github_global {
  echo -e "\n# -- $2 --" >> .gitignore
  curl -s https://raw.githubusercontent.com/github/gitignore/master/Global/$1.gitignore >> .gitignore
  echo "Appended $2."
}

cp .custom.gitignore .gitignore 
append_github_global 'macOS' 'macOS'
append_github_global 'Linux' 'Linux'
append_github_global 'Windows' 'Windows'
append_github_global 'JetBrains' 'JetBrains IDEs'
append_github_global 'VisualStudioCode' 'Visual Studio Code'
append_github_global 'Xcode' 'Xcode'
