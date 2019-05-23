
#!/bin/sh

#async run chromium after run sinatra..> (^o^)b
cd /home/pi/apps/rush_board
bundle exec rackup &
chromium-browser --noerrdialogs --kiosk --incognito http://localhost:9292/
lxterminal
