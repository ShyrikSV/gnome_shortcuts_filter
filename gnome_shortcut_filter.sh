#!/bin/bash

Help()
{
  echo "Usage:"
  echo "To search shortcut Ctrl+Alt+u type:"
  echo "$ gnome_shortcut_filter.sh | grep \"<Control><Alt>Down\""
  echo "Result, if any, will be showed, for example"
  echo "org.gnome.desktop.wm.keybindings :: switch-to-workspace-down :: type as  :: ['<Control><Alt>Down']"
  echo "To disable shortcut type:"
  echo "gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down  \"['']\""
  echo
}


while getopts ":h" option; do
   case $option in
      h) # display Help
         Help
         exit;;
   esac
done


for schema in $(gsettings list-schemas | sort)
do

  for key in $(gsettings list-keys $schema | sort)
    do
      value="$(gsettings range $schema $key | tr "\n" " ")"
      value2="$(gsettings get $schema $key)"
      echo "$schema :: $key :: $value :: $value2"
    done

done
