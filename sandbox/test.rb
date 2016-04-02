require 'httparty'

class NFL
  include HTTParty
  base_uri 'http://www.nfl.com/ajax'
  format :xml
  
  def self.get_reg_games(year, week)
    get('/scorestrip', query: { season: year, seasonType: 'REG', week: week })
  end
end

p NFL.get_reg_games(2015, 1).parsed_response['ss']['gms']