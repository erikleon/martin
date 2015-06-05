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
#   hubot set potty score for <user> [to <score>] - set the user's current score (admin only)
#   hubot reset potty score - clear scoreboard (admin only)
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

  setScore = (id, score, add=false) ->
    data = robot.brain.get('language_credits') or {};
    data[id] or= 0;
    if add
      data[id] += score;
    else
      data[id] = score;
    robot.brain.set('language_credits', data);
    robot.brain.save();

  robot.hear regex, (msg) ->
    setScore(id, words[msg.match[1]]||1, true);
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

  robot.respond /(?:re)?set potty score(?: for @?(.+?)(?: to (\d+))?)?$/, (msg) ->
    if robot.auth and robot.auth.hasRole(msg.envelope.user, 'admin')
      score = (if msg.match[2] then msg.match[2] else 0)|0;
      if msg.match[1]
        user = robot.brain.userForName(msg.match[1]);
        if user
          setScore(user.id, score);
          msg.send "Score for #{user.name} set to #{score}";
        else
          msg.send "I don't know who #{msg.match[1]} is";
      else
        robot.brain.set('language_credits', {});
        robot.brain.save();
        msg.send "Potty scores reset to 0";
    else
      msg.send "You can't do that"
