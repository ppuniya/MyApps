desc "Fetch product prices"
task :fetch_prices => :environment do
	require 'nokogiri'
	require 'open-uri'

	itemsToGet = Shoppingitem.all.collect {|s| s if s.beststore.nil?}
	itemsToGet = itemsToGet.select {|s| !s.nil?}
	itemsToGet.each do |item|
		url = "http://www.walmart.com/search/?query=#{CGI.escape(item.name)}"
		doc = Nokogiri::HTML(open(url))
		price = doc.at_css(".tile-content .price-display").text[/[0-9\.]+/].to_f
		doc.css(".tile-content").each do |item|
			pricetmp = item.at_css(".price-display").text[/[0-9\.]+/].to_f
			if pricetmp < price
				price = pricetmp
			end
		end
		item.update_attribute(:minunitprice, price)
		item.update_attribute(:beststore, "Walmart")
	end
end
