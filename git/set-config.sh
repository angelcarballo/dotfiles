# Let git know who you are
git config --global user.name "$GIT_AUTHOR_NAME"
git config --global user.email "$GIT_AUTHOR_EMAIL"

# only push the current branch
git config --global push.default simple

# global ignore list
git config --global core.excludesfile ~/.gitignore_global

# tell git to use our nice repo template
git config --global init.templatedir '~/.git_template'

git config --global alias.ctags '!~/.git_template/hooks/ctags'

# use diff-so-fancy when diffing
git config --global pager.diff "diff-so-fancy | less --tabs=4 -RFX"
git config --global pager.show "diff-so-fancy | less --tabs=4 -RFX"
