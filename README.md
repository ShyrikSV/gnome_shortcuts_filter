# gnome_shortcuts_filter
Search shortcuts used by Gnome

Gnome can override same IDE shortcuts: \"\<Control\>\<Alt\>Down\" for example might dublicate line in IDE, but not with Ubuntu Gnome default config :). 
To fix this you must change that shortcut or disable it - and this script simplified to find gnome schema and key where this shortcut used:

For example to search shortcut Ctrl+Alt+u type:
```
$gnome_shortcut_filter.sh | grep "<Control><Alt>Down" 
```

Result, if any, will be showed, for example
```
org.gnome.desktop.wm.keybindings :: switch-to-workspace-down :: type as  :: ['<Control><Alt>Down']
```
To disable shortcut type:
```
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down  "['']"
```
  

