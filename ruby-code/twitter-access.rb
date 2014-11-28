require 'twitter'

client = Twitter::Streaming::Client.new do |config|
	config.consumer_key = "E5Qz5KQ8mN4zHCuyzgOQ9kqXU"
	config.consumer_secret = "PBZlmOIfWN0XIpnl3zy5gIGZxYNUW4LTYTzwFA5Na2LZrmDimi"
	config.access_token = "2654510108-R07CdGgtPIimERNRQFVyGLLqbCbQdAA4q2P1v61"
	config.access_token_secret = "tJoApSFmPSvlW2u5NVcgkmAO1z8Hu0RSS2ghqSUOUkTA3"
end


#twit = client.search("#broncos -rt", :lang => "en", :count => 100).first

#puts twit.user.name
#puts "------------------"
#puts twit.user.followers_count
#puts "------------------"
#puts twit.created_at
#puts "------------------"
#puts twit.full_text
#puts "Number of retwwets = " + twit.retweet_count.to_s


def occurences(samplestr)
	searchstrs = ["bear", "recession", "down", "bad", "worse", "skids", "slips"]
	counter = 0
	searchstrs.each do |s|
		counter += samplestr.scan(/#{s}/).count
	end
	return counter
end

topics = ["FX", "Macro", "Markets"]

client.filter(:track => topics.join(",")) do |object|
	if object.is_a?(Twitter::Tweet)
		#if (object.text.include? "Manchester") && (object.user.followers_count > 5000)
		if (occurences(object.text) > 3) && (object.user.followers_count > 5000)
			puts object.user.screen_name
			puts object.user.followers_count
			puts object.text
			puts object.created_at.to_s
			puts "------------------------------------------------------"
		end
	end
end

#client.search("dollar -rt", :lang => "en", :count => 100).each do |twit|
#	if (occurences(twit.text) > 1) && (twit.user.followers_count > 1000)
#		puts "From: " + twit.user.screen_name if twit.user
#		puts "At: " + twit.created_at.to_s 
#		puts "Followed by: " + twit.user.followers_count.to_s if twit.user
#		puts "Occurences = " + occurences(twit.text).to_s
#		puts "----------------"
#		puts twit.text
#		puts "--------------------------------------------------------------------------------"
#	end
#end
