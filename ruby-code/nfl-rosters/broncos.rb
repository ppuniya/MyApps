 require 'rubygems'
 require 'nokogiri'
 require 'open-uri'

url = "http://www.denverbroncos.com/team/roster.html"

doc = Nokogiri::HTML(open(url))
tablebody = doc.at_css("tbody")
tablebody.css("tr").each do |item|
	jersey = item.at_css(".col-jersey").text.strip
	name = item.at_css(".col-name").text.strip
	position = item.at_css(".col-position").text.strip
	height = item.at_css(".col-height").text.strip
	weight = item.at_css(".col-weight").text.strip
	age = item.at_css(".col-bd").text.strip
	exp = item.at_css(".col-exp").text.strip
	college = item.at_css(".col-college").text.strip
	
	namearr = name.split(',').map(&:strip)
	name = namearr[1] + " " + namearr[0]

	puts jersey.to_s + " | " + name.to_s + " | " + position.to_s + " | " + height.to_s + " | " + weight.to_s + " | " + age.to_s + " | " + exp.to_s + " | " + college.to_s 

end
