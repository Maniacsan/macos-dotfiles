LABEL_FONT="SF Pro"
ICON_FONT="Hack Nerd Font"

sketchybar --add event aerospace_workspace_change
sketchybar --add event aerospace_monitor_change

for sid in $(aerospace list-workspaces --all); do
  sketchybar --add item space.$sid left \
    --subscribe space.$sid aerospace_workspace_change \
    --set space.$sid \
    display="$(
      v=$(aerospace list-windows --workspace "$sid" --format "%{monitor-appkit-nsscreen-screens-id}" | cut -c1)
      echo "${v:-1}"
    )" \
    drawing=off \
    background.color=0x44ffffff \
    background.corner_radius=12 \
    background.drawing=on \
    background.border_color=0xAAFFFFFF \
    background.border_width=0 \
    background.height=25 \
    icon="$sid" \
    icon.padding_left=10 \
    icon.shadow.distance=4 \
    icon.shadow.color=0000000000 \
    label.font="sketchybar-app-font:Regular:13.0" \
    label.padding_right=20 \
    label.padding_left=0 \
    label.y_offset=-1 \
    label.shadow.drawing=off \
    label.shadow.color=0000000000 \
    label.shadow.distance=4 \
    click_script="aerospace workspace $sid" \
    script="../plugins/aerospace.sh $sid"
done

# Load Icons on startup
for mid in $(aerospace list-monitors | cut -c1); do
  for sid in $(aerospace list-workspaces --monitor $mid --empty no); do
    apps=$(aerospace list-windows --workspace "$sid" | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')

    sketchybar --set space.$sid drawing=on \
               background.color=0x44FFFFFF \
               background.drawing=on

    icon_strip=" "
    if [ "${apps}" != "" ]; then
      while read -r app; do
        icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
      done <<<"${apps}"
    else
      icon_strip=""
    fi
    sketchybar --set space.$sid label="$icon_strip"
  done
done

sketchybar --add item space_separator left \
  --set space_separator icon="  " \
  icon.padding_left=4 \
  label.drawing=off \
  background.drawing=off \
  script="../plugins/space_windows.sh" \
  --subscribe space_separator aerospace_workspace_change front_app_switched space_windows_change aerospace_monitor_change