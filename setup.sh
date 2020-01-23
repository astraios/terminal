#!/usr/bin/env bash

# Configuring env and terminal

###########################################
# Functions (prints)
###########################################

# Simple color declaration
RED=$'\e[1;31m'
GRN=$'\e[1;32m'
BLU=$'\e[1;34m'
YEL=$'\e[1;33m'
END=$'\e[0m'

# How are the function used?
# You can just print_step to inform on what step you plan to take.
# Then use print_check for one of a particular task.
# Try then print_sucess|warning|error depending of the task completion status

function print_success() {
  printf "%s\n" $GRN"$1"$END
}

function print_warning() {
  printf "%s\n" $YEL"${1}"$END
}

function print_error() {
  printf "%s\n" $RED"$1"$END
}

function print_check() {
  printf "%-40s" "${1}"
}

function print_step() {
  printf "\n%s\n" $BLU"${1}"$END
}

###########################################
# Functions
###########################################

function detect_os() {
  echo "Detected OS is pouet"
}

function install_brew() {

  print_check "Installing brew"
  if ! command -v brew > /dev/null 2>&1; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    if [[ $? -eq "0" ]]; then
      print_success "[OK]"
      else
      print_error "[Failed]"
    fi
  else
    print_warning "Already installed"
  fi

}

function install_pip_packages {
  print_check "Installing pip requirements"
  pip3 install virtualenv ansible
}
###########################################
# Main
###########################################

# Installing requirements
print_step "Installing requirements"

# Mac requirements
if [[ "$OSTYPE" == "darwin"* ]]; then

  install_brew
  install_pip_packages

fi

# todo list
print_step "Manual install requirements"
echo "* Install dracula https://draculatheme.com/terminal/"
echo "* Install Update dracula theme with MesloLGS"

