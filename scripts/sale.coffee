# Description:
#   Show whats on Sale Betch
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot lets shop - a randomly selected HNM sale
#   hubot whats for sale - if a bunch of is on sale let me know!
#
# Author:
#   erikleon



module.exports = (robot) ->
  robot.respond /lets\s*(?:shop)?$/i, (msg) ->
    msg.send lets shop betch!
  robot.respond /whats\s+(?:for)\s*(?:sale)?\s*(\d+)?/i, (msg) ->
    msg.send you can look yourself betch!
show_octocats = (msg, count) ->
  msg.http('http://feeds.feedburner.com/Octocats')
    .query(format: 'xml')
    .get() (err, res, body) ->
      parser = new xml2js.Parser()
      parser.parseString body, (err, result) ->
        octocats = (r["content"]["div"]["a"]["img"]["@"]["src"] for r in result["entry"])
        msg.send msg.random octocats for i in [1..count]
