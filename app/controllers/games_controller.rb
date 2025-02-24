require "json"
require "open-uri"

class GamesController < ApplicationController

  def new
    @letters = []
    10.times do
      @letters << ('a'..'z').to_a.sample
    end
  end

  def score
    url = "https://dictionary.lewagon.com/#{params[:attempt]}" # chercher le mot(params[:attempt]) dans le dico
    wordapi = URI.parse(url).read
    @word = JSON.parse(wordapi) # reponse API
    @result = params[:attempt].chars.all? { |char| params[:attempt].count(char) <= params[:letters].count(char) } # decompose le mot en lettre et calcul le nbre de chaq lettre pour comparaison avec grille
    if @result == true
      @output = "you win"
    else
      @output = "you lose"
    end
  end
end
