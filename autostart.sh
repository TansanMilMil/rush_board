
#!/bin/sh

#async run chromium after run sinatra..> d(^o^)b
cd /home/pi/apps/rush_board
chromium-browser --noerrdialogs --kiosk --incognito http://localhost:9292 &
bundle exec rackup
