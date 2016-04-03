
require_relative '../config/environment'

class NFL
  include HTTParty
  base_uri 'http://www.nfl.com/ajax'
  format :xml
  
  def self.get_reg_games(year, week)
    get('/scorestrip', query: { season: year, seasonType: 'REG', week: week })
  end
end

games_data = NFL.get_reg_games(2015, 1)['ss']['gms']['g']

games_data.each do |dat|
  game = Game.new
  game.date = Date.parse(dat['eid'][0,8])
  game.home_team = dat['h']
  game.away_team = dat['v']
  game.home_score = dat['hs']
  game.away_score = dat['vs']
  game.season_year = 2015
  game.week = 1
  p game
end
