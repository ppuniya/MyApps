require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'cgi'

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

searchstr = "bookcase"

url = "http://www.argos.co.uk/static/Search/searchTerm/#{CGI.escape(searchstr)}.htm"

doc = Nokogiri::HTML(open(url))
puts doc.at_css("title").text

minprice = doc.at_css(".main")
puts minprice
if minprice
	minprice = minprice.text.gsub(/[^0-9\.]/, '').to_f
end

puts "First price = #{minprice}"

doc.css(".productWithRating").each do |item|
	title = item.at_css('.title')
	if title
		title = title.text
	end
	price = item.at_css(".main")
	if price
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
	if title && price
		ldistance = levenshtein(title, searchstr)
		puts "#{title} - #{price} - #{ldistance}"
	end
end
puts "Minimum price = #{minprice}"
