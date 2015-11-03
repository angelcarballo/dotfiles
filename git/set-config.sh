git config --global user.name "$GIT_AUTHOR_NAME"
git config --global user.email "$GIT_AUTHOR_EMAIL"
git config --global push.default simple
git config --global core.excludesfile ~/.gitignore_global
git config --global init.templatedir '~/.git_template'
git config --global alias.ctags '!~/.git_template/hooks/ctags'
