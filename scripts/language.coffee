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
    'bugger',
    'bollocks',
    'bullshit',
    'cock',
    'cunt',
    'damn',
    'damnit',
    'depp',
    'dick',
    'douche',
    'fag',
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
    'shit',
    'wank',
    'wichser'
  ]
  regex = new RegExp('(?:^|\\s)(' + words.join('|') + ')(?:\\s|\\.|\\?|!|$)', 'i');

  robot.hear regex, (msg) ->
    msg.send 'You have been fined one credit for being a potty mouth.'