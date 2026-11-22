# Project Plan 
## Major Components/Parts
- INSTALL file
  - startup
  - setup
  - how to download
- install script
  - name it
  - set up wifi
  - configure users
  - 
- README file
  - how to install radio stations

- how we include the course concepts
  - users -> different users can configure favourites, installed radio stations, etc (colour preferences??)
  - bash scripts ->
    - install script
    - adding users 
    - installing radios
    - network config
    - radio interfacing (switching, etc)
    - volume adjustment
  - file archives/compression etc -> release could be in a tar.gz
  - links -> installed radio stations should kept in one central place, away from users, soft links to user directories
  - search -> when installing a new radio first checks if it exists yet

> [!IMPORTANT] Links
> superuser thread  on vlc commands for playback <br/>
> [https://superuser.com/questions/204161/is-it-possible-to-play-a-song-in-vlc-player-out-of-the-command-line](https://superuser.com/questions/204161/is-it-possible-to-play-a-song-in-vlc-player-out-of-the-command-line) <br/>
> radio tutorial: https://www.instructables.com/Raspberry-Pi-Internet-Radio/ <br/>
> code for that tutorial: https://github.com/oschettler/radio <br/>
> another tutorial, looks more stripped down i think: https://www.raspberrypi.com/news/build-an-internet-radio/ <br/>
## File structure (prelimenaray)
| / <br/>
|-root/ <br/>
| |- radios/ <br/>
| | |- <radioName\>.m3u <br/>
| |- scripts/ <br/>
| | |- <span style="color:green">install</span> <br/>
| | |- <span style="color:green">addradio</span> <br/>
| | |- <span style="color:green">newuser</span> <br/>
| | |- <span style="color:green">radio</span> <br/>
| | |- <span style="color:green">setvolume</span> <br/>
| | |- <span style="color:green">wificonfig</span> <br/>
|- home/ <br/>
| |- [users]/ <br/>
| | |- radios/ <br/>
| | | |- <span style="color:green"><radioName\></span> <br/>
| | |- .config/ <br/>
| | | |- radio.toml <br/>
# TODO
- links that are nice
  - we could use vlc for managing playback
  - [https://superuser.com/questions/204161/is-it-possible-to-play-a-song-in-vlc-player-out-of-the-command-line](https://superuser.com/questions/204161/is-it-possible-to-play-a-song-in-vlc-player-out-of-the-command-line)
  - radio tutorial: https://www.instructables.com/Raspberry-Pi-Internet-Radio/
  - code for that tutorial: https://github.com/oschettler/radio
  - another tutorial, looks more stripped down i think: https://www.raspberrypi.com/news/build-an-internet-radio/

## Task assignment
| Task | Assigned | Done |
| --- | --- | --- |
| Write INSTALL.md | | o |
| Write README.md | | o |
| Install script | | o |
| User add script | | o |
| Install radio script | | o |
| Configure network script | | o |
| Radio interface script | | o |
| Volume adjustment script | | o |
| Radio TUI | | o |
| Radio GUI (?) | | o |
