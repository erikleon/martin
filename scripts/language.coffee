# Description:
#   Watch your language!
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#
# Author:
#   whitman, jan0sch

module.exports = (robot) ->

  words = [
    'arse',
    'ass',
    'bastard',
    'bitch',
    'bill cosby',
    'bugger',
    'bollocks',
    'cock',
    'cocksucker',
    'cunt',
    'dick',
    'dike',
    'dipshit',
    'douche',
    'fag',
    'faggot',
    'fotze',
    'fuck',
    'fucked',
    'fucking',
    'kacke',
    'patriarchy',
    'piss',
    'skank',
    'shithead',
    'shitzipper',
    'slut',
    'wank',
    'whore'
  ]
  regex = new RegExp('(?:^|\\s)(' + words.join('|') + ')(?:\\s|\\.|\\?|!|$)', 'i');

  robot.hear regex, (msg) ->
    msg.send 'You have been fined one credit for being a potty mouth.'