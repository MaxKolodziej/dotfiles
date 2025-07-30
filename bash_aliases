#!/usr/bin/env bash

alias be="bundle exec"
alias bi="bundle install"
alias ls='ls -la'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias vim="nvim"
alias gut='git'
alias gc="git commit"
alias gf="git fetch"
alias gb="git branch"
alias gd="git diff --no-prefix"
alias gdc="git diff --cached --no-prefix"
alias ga="git add"
alias gA="git add -A"
alias gpb="git pivotal-branch"
alias gpr="git pull-request"
alias gm="git merge"
alias gsh="git push --follow-tags"
alias gtags='git for-each-ref --sort="-*authordate" --format="%(tag) - %(taggerdate:short)%0a%(contents)" refs/tags | less'
alias gll="git pull"
alias go="git checkout"
alias gr="grep -i"
alias gres="git reset"
alias gl="git log --oneline"
gor() {
  git checkout -t $(git branch -r | grep -i "$@" | tail -1)
}
grh() {
  git fetch; git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)
}
gg() {
  git grep -i -n $@ | cat -n | cut -c -180
}
gds() {
  awk '/---/{ FILENAME=$0; next } /'"$1"'/ {{ print FILENAME "\n" $0 } {for(i=1; i<=10; i++) {getline; print}}}' | grep -v '^+'
}
gpu() {
  echo "You're going to execute: git push -u origin $(git rev-parse --abbrev-ref HEAD)"
  sleep 1
  git push -u origin $(git rev-parse --abbrev-ref HEAD)
}
gld() {
  git diff | gds $@
  git show HEAD | gds $@
}
glc() {
  command=$(git show --name-only --oneline HEAD | tail +2 | awk '{print $1}' | cat -n)
  echo $command
  result=$command
  if [[ -z $1 ]]
  then
    echo 'Put line number'
  else
    number=$1
    line=$(echo $result | awk "\$1 ~ /^$number/" | head -1 | awk '{print $2}' | tr -d " \r\n\t")
    echo $line | tr -d " \r\n\t"
    echo "copied to clipboard: "
    echo $line | tr -d " \r\n\t" | clip_copy
  fi
}
alias stash="git stash -u"
alias unstash="git stash pop"
alias unstash_reset="git reset --merge"
alias gsl="git stash list"

alias gs="git status --porcelain | cat -n"

gsc() {
  command=$(history | grep " gs$" | tail -1 | awk '{print $2,$3,$4,$5}')
  result=$(eval "$command")
  if [[ -z $1 ]]
  then
    echo 'Put line number'
  else
    line=$(echo $result | awk "NR==$1" | awk '{print $3}' | tr -d " \r\n\t")
    echo $line | tr -d '\n'
    echo ""
    echo $line | tr -d '\n' | clip_copy
  fi
}

alias rt="RAILS_ENV=test bundle exec rspec"
alias mt="RAILS_ENV=test bundle exec rails test"

git_recent_branches() {
  git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)' | head -n 30
}

gon() {
  git_recent_branches | head -n 30 | nl
  echo 'Which branch: '
  read branch_number
  branch_name=$(git_recent_branches | awk "NR==$branch_number" | tr -d ' ')
  git checkout $branch_name
}

rfix() {
  filenames=$(git diff HEAD --name-only --diff-filter=ACM | grep -v db/schema.rb | grep "\.rb" | tr '\n' ' ')
  command="bundle exec rubocop -A $filenames"
  echo $command
  eval $command
}

rlfix() {
  last_commit=$(git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)' | head -n 1)
  filenames=$(git diff-tree --no-commit-id --name-only -r $last_commit | grep -v db/schema.rb | grep "\.rb" | tr '\n' ' ')
  command="bundle exec rubocop -A $filenames"
  echo $command
  eval $command
}

gcname() {
  name=$(git rev-parse --abbrev-ref HEAD | sed -E "s/(\-)([0-9]+)/(#\2):/" | sed "s/-/ /g" | sed "s/\(feat\|chore\|fix\)\///g")
  echo $name
  echo $name | clip_copy
}
alias rcop="bundle exec rubocop -A"
alias seed="bundle exec rake db:seed"

migrate() {
  rake db:migrate
  RAILS_ENV=test rake db:migrate
}
rmd() {
  rake db:migrate:down VERSION=$1
}

rmu() {
  rake db:migrate:up VERSION=$1
}

rollback() {
  if [[ -z $1 ]]
  then
    echo 'Put number of rollback steps'
  else
    rake db:rollback STEP=$1
    RAILS_ENV=test rake db:rollback STEP=$1
  fi
}

run10() {
  for i in {1..10}; do $@; done
}
run50() {
  for i in {1..50}; do $@; done
}

set -o vi
