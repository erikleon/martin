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
#   hubot potty score - show the current scoreboard for curse words
#
# Author:
#   whitman, jan0sch, ttsanev

module.exports = (robot) ->

  words = {
    'arse': 1,
    'ass': 1,
    'bastard': 1,
    'bitch': 2,
    'bill cosby': 4,
    'bugger': 1,
    'bollocks': 1,
    'cock': 2,
    'cocksucker': 1,
    'cunt': 4,
    'dick': 2,
    'dike': 1,
    'dipshit': 3,
    'douche': 1,
    'fag': 4,
    'faggot': 4,
    'fotze': 1,
    'fuck': 2,
    'fucked': 2,
    'fucking': 2,
    'kacke': 1,
    'patriarchy': 2,
    'piss': 1,
    'skank': 1,
    'shithead': 1,
    'shitzipper': 1,
    'slut': 1,
    'wank': 1,
    'whore': 1
  };
  regex = new RegExp('(?:^|\\s)(' + Object.keys(words).join('|') + ')((?=s)es|s)?(?:\\s|\\.|\\?|!|$)', 'i');

  robot.hear regex, (msg) ->
    weight = words[msg.match[1]]||1;
    data = robot.brain.get('language_credits');
    if !data
      data = {};
    if !data[msg.envelope.user.id]
      data[msg.envelope.user.id] = 0;
    data[msg.envelope.user.id] += weight;
    robot.brain.set('language_credits', data)
    robot.brain.save()
    msg.send '@' + msg.envelope.user.mention_name + ', you have been fined ' + weight + ' credit' + (if weight != 1 then "s" else "") + ' for being a potty mouth.';

  robot.respond /potty score/i, (msg) ->
    data = robot.brain.get('language_credits')
    if !data
      msg.send "No scores saved yet"
    else
      resp = "";
      for k,v of data
        user = robot.brain.userForId(k);
        if user
          resp += "\t" + user.name + ": " + v + " credit" + (if v != 1 then "s" else "") + "\n"
      if resp
        msg.send "Scores: \n" + resp
      else
        msg.send "No scores found for the current users"
