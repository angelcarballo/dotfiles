if grep -q 'bash_common' "$HOME/.bashrc"
then
  echo 'Already linked bash_common'
else
  echo 'Linking .bash_common to .bashrc'
  cat ./include_common >> ~/.bashrc
fi
