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
#
# Notes:
#   
#
# Author:
#   erikleon

xml2js = require('xml2js')

module.exports = (robot) ->
  robot.hear /go\s*(?:shopping)?$/i, (msg) ->
    msg.send "lets shop betch!"
  robot.hear /whats\s+(?:for)\s*(?:sale)?\s*(\d+)?/i, (msg) ->
    msg.send "you can look yourself betch!"
    


