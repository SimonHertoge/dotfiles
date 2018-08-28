#!/usr/bin/env python
import pylast
import webbrowser
import libs.lastfm_credentials as cred

network = pylast.LastFMNetwork(api_key=cred.apikey, api_secret=cred.secret,
        username=cred.username, password_hash=pylast.md5(cred.password))

user = network.get_user(cred.username)
track = user.get_now_playing()
webbrowser.open(track.get_url())
