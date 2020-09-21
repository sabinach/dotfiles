~/.BASH_PROFILE SETTINGS

# added by Anaconda3 5.2.0 installer
export PATH="/anaconda3/bin:$PATH"

#export PATH=$PATH:~/.local/bin
export PYTHONPATH="/usr/lib/python2.7/site-packages:$PYTHONPATH"

# Alias for python to default to python2.
alias python=/usr/bin/python2.7
alias python3=/usr/local/bin/python3

# Alias for Changing Terminal SSH Color
alias ssh="~/.ssh/color.sh"

# Aliases for jupyter-notebook
alias jn="jupyter-notebook"

# Aliases for rms-website (deploy gh-pages update)
alias rd="git subtree push --prefix _build/html origin gh-pages"

# Alias for sourcing ~/.bash_profile
alias bv="vim ~/.bash_profile"
alias bs="source ~/.bash_profile"

# Link executable for Julia
# https://en.wikibooks.org/wiki/Introducing_Julia/Getting_started#On_macOS_X
ln -fs "/Applications/Julia-1.4.app/Contents/Resources/julia/bin/julia" /usr/local/bin/julia
