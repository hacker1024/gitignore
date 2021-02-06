#!/bin/sh
set -e

function include_local_includes {
	for f in local_includes/*; do
		cat $f >> .gitignore.tmp
		echo '' >> .gitignore.tmp
		echo "Included $f."
	done
}

function include_github_global {
	echo "# -- $2 --" >> .gitignore.tmp
	printf '%s\n\n' "$(curl -s https://raw.githubusercontent.com/github/gitignore/master/Global/$1.gitignore)" >> .gitignore.tmp
	echo "Included github/$2."
}

include_local_includes
include_github_global 'macOS' 'macOS'
include_github_global 'Linux' 'Linux'
include_github_global 'Windows' 'Windows'
include_github_global 'JetBrains' 'JetBrains IDEs'
include_github_global 'VisualStudioCode' 'Visual Studio Code'
include_github_global 'Xcode' 'Xcode'

tail -r < .gitignore.tmp | tail -n +2 | tail -r > .gitignore
rm .gitignore.tmp