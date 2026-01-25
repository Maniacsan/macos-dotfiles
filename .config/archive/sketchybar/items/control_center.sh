sketchybar --add alias "Control Center" right \
           --set      "Control Center" \
                      click_script="osascript -e 'tell application \"System Settings\"
                                                     set current pane to pane id \"com.apple.Sound-Settings.extension\"
                                                     activate
                                                  end tell'"
