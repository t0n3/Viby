# -*- coding: utf-8 -*-

class Helix
  include Cinch::Plugin

  match /(?:helix)/i

  set :help => "Ask Helix Fossil : !helix and your request."

  def initialize(*args)
    super
    @helix = ["It is certain","It is decidedly so","Without a doubt","Yes definitely","You may rely on it","As I see it, yes","Most likely","Outlook good","Yes","Signs point to yes","Reply hazy try again","Ask again later","Better not tell you now","Cannot predict now","Concentrate and ask again ","Don't count on it","My reply is no","My sources say no","Outlook not so good","Very doubtful","no.","START","A","B","UP","DOWN","LEFT","RIGHT","SELECT"]
  end

  def execute m
    m.reply "Helix says : « #{@helix.sample} », #{m.user}"
  end

end
