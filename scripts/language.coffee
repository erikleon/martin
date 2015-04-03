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
    'arsch',
    'arschloch',
    'arse',
    'ass',
    'bastard',
    'bitch',
    'bill cosby',
    'bugger',
    'bollocks',
    'bullshit',
    'cock',
    'cocksucker',
    'cunt',
    'damn',
    'damnit',
    'depp',
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
    'hell',
    'kacke',
    'piss',
    'pisse',
    'scheisse',
    'schlampe',
    'skank',
    'shit',
    'shithead',
    'shitzipper',
    'slut',
    'wank',
    'whore',
    'wichser'
  ]
  regex = new RegExp('(?:^|\\s)(' + words.join('|') + ')(?:\\s|\\.|\\?|!|$)', 'i');

  robot.hear regex, (msg) ->
    msg.send 'You have been fined one credit for being a potty mouth.'