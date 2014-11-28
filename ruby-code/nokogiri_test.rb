 require 'rubygems'
 require 'nokogiri'
 require 'open-uri'

url = "http://www.walmart.com/search/?query=Samsung%2042%20lcd%20tv"

doc = Nokogiri::HTML(open(url))
puts doc.at_css("title").text
minprice = doc.at_css(".price-display")
puts "First price text = #{minprice.text.gsub(/[^0-9\.]/, '')}"
if minprice
	minprice = minprice.text.gsub(/[^0-9\.]/, '').to_f
end
puts "First price = #{minprice}"
doc.css(".tile-content").each do |item|
	title = item.at_css(".js-product-title").text
	price = item.at_css(".price-display")
	if price
		price=price.text.gsub(/[^0-9\.]/, '').to_f
	end
	puts "#{title} - #{price}"
	if price
	if minprice > price.to_f
		minprice = price.to_f
	end
	end
end
puts "Minimum price = #{minprice}"
