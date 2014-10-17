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
    msg.send "lets shop betch!"
  robot.respond /whats\s+(?:for)\s*(?:sale)?\s*(\d+)?/i, (msg) ->
    msg.send "you can look yourself betch!"
