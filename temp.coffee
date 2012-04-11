request = require "request"
Track
	.findOne
		sc_id : sc_id
	.run (err, track) -> 
		if track
			playlist.addTrack(track)
			options =
				track : track
				playlist : playlist
			streaming_url = http.request track.stream_url + "?client_id=" + sc_config.client_id, (e, r, body) ->
				logger.log r.requests.redirects
			socket.emit "account_channel_#{hs.session.account.id}",
				action : "play_track"
				html : jadeRender 'partials/player',
					track : track
					playing_from : "search"
					streaming_url : streaming_url``
		else
			options =
					host: "api.soundcloud.com"
					path: "/tracks.json?client_id=" + sc_config.clientId + "&ids=" + sc_id
					port: 80
					headers:
						client_id : sc_config.clientId
			http.get( options,
					(sc_res) ->
						data = ""
						sc_res.on "data", (chunk) -> 
							data += chunk
						sc_res.on "end", () ->
							track_data = JSON.parse(data)[0]
							track = new Track(track_data)
							track.save()							
							promise.complete(track)
							playlist.addTrack(Track)
							options =
								track : track
								playlist : playlist
							return options
					).on "error", (e) ->
						logger.log clc.red("error:" + e.message)