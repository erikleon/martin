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

xml2js = require('xml2js')

module.exports = (robot) ->
  robot.respond /lets\s*(?:shop)?$/i, (msg) ->
    msg.send "lets shop betch!"
  robot.respond /whats\s+(?:for)\s*(?:sale)?\s*(\d+)?/i, (msg) ->
    msg.send "you can look yourself betch!"
shop_betch = (msg, count) ->
  msg.http('http://www.hm.com/us/subdepartment/sale?Nr=4294964541')
    .query(format: 'xml')
    .get() (err, res, body) ->
      parser = new xml2js.Parser()
      parser.parseString body, (err, result) ->
        msg.send parser
