class ItemsWorker
	include Sidekiq::Worker
	sidekiq_options retry: false

	def perform(item_id)
		require 'nokogiri'
		require 'open-uri'

		sitem = Shoppingitem.find(item_id)
		url = "http://www.walmart.com/search/?query=#{CGI.escape(sitem.name)}"
		doc = Nokogiri::HTML(open(url))
		price = doc.at_css(".tile-content .price-display")
		if price
			price = price.text.gsub(/[^0-9\.]/, '').to_f
		end
		doc.css(".tile-content").each do |it|
			pricetmp = it.at_css(".price-display")
			if pricetmp
				pricetmp = pricetmp.text.gsub(/[^0-9\.]/, '').to_f
				if price
					if pricetmp < price
						price = pricetmp
					end
				else
					price = pricetmp
				end
			end
		end
		sitem.update_attribute(:minunitprice, price)
		sitem.update_attribute(:beststore, "Walmart")
	end

end
