require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'cgi'
require 'openssl'

def levenshtein(first, second)
	 matrix = [(0..first.length).to_a]
	 (1..second.length).each do |j|
		matrix << [j] + [0] * (first.length)
	 end

	 (1..second.length).each do |i|
	 	(1..first.length).each do |j|
	 		if first[j-1] == second[i-1]
	 			matrix[i][j] = matrix[i-1][j-1]
	 		else
	 			matrix[i][j] = [ matrix[i-1][j], matrix[i][j-1], matrix[i-1][j-1], ].min + 1
	 		end
	 	end
	 end
	 return matrix.last.last
end

searchstr = "organic tomatoes"

url = "https://groceries.morrisons.com/webshop/getSearchProducts.do?clearTabs=yes&isFreshSearch=true&entry=#{CGI.escape(searchstr)}"

puts url
doc = Nokogiri::HTML(open(url, :ssl_verify_mode=>OpenSSL::SSL::VERIFY_NONE))
puts doc.at_css("title").text

minprice = doc.at_css(".pricePerWeight")
if minprice
	if minprice.text.include? "kg"
		minprice = minprice.text.gsub(/[^0-9\.]/, '').to_f
	else
		minprice = nil
	end
end

puts "First price = #{minprice}"

doc.css(".productDetails").each do |item|
	title = item.at_css('.productTitle')
	title = title.at_css('strong[itemprop=name]').text
	price = item.at_css(".pricePerWeight")
	if price
		if price.text.include? "kg"
			price = price.text.gsub(/[^0-9\.]/, '').to_f
			if minprice
				if price < minprice
					minprice = price
				end
			else
				minprice = price
			end
		else
			price = nil
		end
	end
	if title && price
		ldistance = levenshtein(title, searchstr)
		puts "#{title} - #{price} - #{ldistance}"
	end
end
puts "Minimum price = #{minprice}"
