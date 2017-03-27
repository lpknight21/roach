#Description:
#	Calls the gwent api for card info.
#
#Commands:
#	hubot card info <cardName>

https = require 'https'

module.exports = (robot) ->
	robot.respond /card info (.*)/i, (msg) ->
		cardName = msg.match[1]

		url = "https://gwent-api.herokuapp.com/card/name/#{cardName}/info?withTokens=true"

		msg.http(url)
			.get() (err, res, body) ->
				try
					msg.send body
				catch error
					msg.send "Trouble fetching card info."