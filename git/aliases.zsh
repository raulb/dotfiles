# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# The rest of my fun git aliases
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'

# Remove `+` and `-` from start of diff lines; just rely upon color.
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'

alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias gac='git add -A && git commit -m'
alias ge='git-edit-new'

# New by @raulb
alias gr='git pull --rebase --prune'
alias gpf='git push --force-with-lease origin'
alias gprune="git branch -vv | grep ': gone]'| grep -v '\*' | awk '{ print $1; }' | xargs -r git branch -D"
alias gaa="git add ."
alias grc="git rebase --continue"
alias garc="git add . && git rebase --continue"
alias gri="git rebase -i HEAD~"
alias gfo="git fetch origin"


# 🎩 @mamuso
# In a folder full of repos, go into each one of them, pull the current branch and remove local branches already merged
alias gupcl='for d in *; do push $d; git pull; gclear; popd; done'

# Remove local branches already merged
alias gclear=$'git fetch -p && for branch in `git for-each-ref --format \'%(refname) %(upstream:track)\' refs/heads | awk \'$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}\'`; do git branch -D $branch;done'