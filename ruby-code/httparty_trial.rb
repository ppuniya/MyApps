require 'httparty'
require 'json'

gamestr = "2010010300"

response = HTTParty.get("http://www.nfl.com/liveupdate/game-center/#{gamestr}/#{gamestr}_gtd.json")
puts response
response.each do |field, value|
	if value.class.to_s == 'Hash'
		value.each do |field1, value1|
			if value1.class.to_s == 'Hash'
				value1.each do |field2, value2|
					if value2.class.to_s == 'Hash'
						value2.each do |field3, value3|
							if value3.class.to_s == 'Hash'
								value3.each do |field4, value4|
									if value4.class.to_s == 'Hash'
										value4.each do |field5, value5|
											if value5.class.to_s == 'Hash'
												value5.each do |field6, value6|
													puts field + " --> " + field1 + " --> " + field2 + " --> " + field3 + " --> " + field4 + " --> " + field5 + " --> " + field6 + " --> " + value6.class.to_s
												end
											else
												puts field + " --> " + field1 + " --> " + field2 + " --> " + field3 + " --> " + field4 + " --> " + field5 + " --> " + value5.class.to_s
											end
										end
									else
										puts field + " --> " + field1 + " --> " + field2 + " --> " + field3 + " --> " + field4 + " --> " + value4.class.to_s
									end
								end
							else
								puts field + " --> " + field1 + " --> " + field2 + " --> " + field3 + " --> " + value3.class.to_s
							end
						end
					else
						puts field + " --> " + field1 + " --> " + field2 + " --> " + value2.class.to_s
					end
				end
			else
				puts field + " --> " + field1 + " --> " + value1.class.to_s
			end
		end
	else
		puts field + " --> " + value.class.to_s
	end
end
#puts JSON.parse(response.to_s)

