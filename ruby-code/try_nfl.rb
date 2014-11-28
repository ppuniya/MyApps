require 'httparty'
require 'json'

gamestr = "2014111607"

response = HTTParty.get("http://www.nfl.com/liveupdate/game-center/#{gamestr}/#{gamestr}_gtd.json")

response = response.values.first

response = response["drives"]

response = response.values.first

response = response["plays"]

puts response.keys.count
response.each do |k, v|
#res.each do |key, value|
#		puts key.to_s + " --- " + value["qtr"].to_s + " --- " + value["time"]
#end
end

#response.each do |key, value|
#	if key != "crntdrv"
#		puts value["plays"].first
		#value["plays"].each do |key1, val1|
		#	puts key1
		#	puts val1
		#end
#	end
#end
