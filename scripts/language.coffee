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
    data = robot.brain.get('language_credits');
    if !data
      data = {};
    if !data[msg.envelope.id]
      data[msg.envelope.id] = 0;
    data[msg.envelope.id]++;
    robot.brain.set('language_credits', data)
    msg.send '@' + msg.envelope.user.name + ', you have been fined one credit for being a potty mouth.';

  robot.respond /potty score/i, (msg) ->
    data = robot.brain.get('language_credits')
    if !data
      msg.send "No scores saved yet"
    else
      for i in data
        console.log(i);