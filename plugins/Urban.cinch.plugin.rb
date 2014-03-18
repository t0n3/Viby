# -*- coding: utf-8 -*-
require 'open-uri'
require 'nokogiri'
require 'cgi'

class Urban
    include Cinch::Plugin
    
    set :help => "!urban word"

    match(/(?:urban) (.*)/, :use_prefix => true)
    def initialize(*args)
        super
        @url = "http://www.urbandictionary.com/define.php?term="
    end

    def execute(m, word)
        page = Nokogiri::HTML(open("#{@url}#{CGI.escape(word)}"))
        begin
          word = page.css(".word > a").first
          wordDef = page.css(".meaning").first
          wordDef.css("br").each{ |br| br.replace("\n") }
          m.reply "#{m.user}, « #{word.content} » : #{wordDef.content}"
        rescue 
          return m.reply "I don't know this word."
        end
    end
end
