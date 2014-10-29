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
#   lets shop - a randomly selected HNM sale
#   whats for sale - if a bunch of is on sale let me know!
#
# Author:
#   erikleon

xml2js = require('xml2js')

module.exports = (robot) ->
  robot.hear /lets\s*(?:shop)?$/i, (msg) ->
    msg.send "lets shop betch!"
  robot.hear /whats\s+(?:for)\s*(?:sale)?\s*(\d+)?/i, (msg) ->
    msg.send "you can look yourself betch!"
    


