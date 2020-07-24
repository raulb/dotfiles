# If using with asdf, make sure:
# › /usr/bin/which node
# ~/.asdf/shims/node

# In case there are problems between node installed by Homebrew
# and version used by asdf do:
# 
# brew uninstall --ignore-dependencies node
# ln -s ~/.asdf/shims/node /usr/local/bin/node

if test ! $(which spoof)
then
  if test $(which npm)
  then
    sudo npm install spoof -g
  fi
fi
