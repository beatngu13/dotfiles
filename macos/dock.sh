#!/bin/bash

dockutil --no-restart --add "/Applications/Atom.app"
dockutil --no-restart --add "/Applications/Eclipse.app"
dockutil --no-restart --add "/Applications/SourceTree.app"
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/Applications/WhatsApp.app"
dockutil --no-restart --add "/Applications/Spotify.app"

killall Dock
