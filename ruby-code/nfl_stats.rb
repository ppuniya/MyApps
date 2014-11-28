require 'httparty'
require 'json'

gamestr = "2010010300"

response = HTTParty.get("http://www.nfl.com/liveupdate/game-center/#{gamestr}/#{gamestr}_gtd.json")

keys = response.keys
game = Hash["id", keys[0]]
res = response[game["id"]]
keys = res.keys
(5..keys.size).each do |i|
	game[keys[i-1]] = res[keys[i-1]]
end

datas = res[keys[0]]
datakeys = datas.keys
hometeamscore = datas[datakeys[0]]
hometeamscore["game_id"] = game["id"]
hometeamscore[datakeys[1]] = datas[datakeys[1]]
hometeamscore[datakeys[2]] = datas[datakeys[2]]

datastats = datas[datakeys[3]]
keystats = datastats.keys
puts keystats


datas = res[keys[1]]
datakeys = datas.keys
awayteamscore = datas[datakeys[0]]
awayteamscore["game_id"] = game["id"]
awayteamscore[datakeys[1]] = datas[datakeys[1]]
awayteamscore[datakeys[2]] = datas[datakeys[2]]


#response.each do |field, value|
#end

