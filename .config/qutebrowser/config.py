# config.py qutebrowser configuration file
# gnus@telia.com

config.bind('<Alt-m>', 'hint links spawn mpv --ontop --autofit=540x324 --geometry=99%:2% $1 {hint-url}')
config.bind('<Alt-v>', 'hint links spawn vlc  --video-on-top --qt-minimal-view --width=540 --height=324 --play-and-exit {hint-url}')
config.bind('sp', 'spawn --userscript qutepocket')
