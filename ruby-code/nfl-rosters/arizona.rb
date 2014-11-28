 require 'rubygems'
 require 'nokogiri'
 require 'open-uri'

url = "http://www.houstontexans.com/team/roster.html"
teammainobj = ".bd tbody"
teamiterobj = "tr"
teamjersey = ".col-jersey"
teamname = ".col-name"
teampos = ".col-position"
teamhgt = ".col-height"
teamwgt = ".col-weight"
teamage = ".col-bd"
teamexp = ".col-exp"
teamcollege = ".col-college"


doc = Nokogiri::HTML(open(url))
tablebody = doc.at_css(teammainobj.to_s)
tablebody.css(teamiterobj.to_s).each do |item|
	jersey = item.at_css(teamjersey.to_s).text.strip
	name = item.at_css(teamname.to_s).text.strip
	position = item.at_css(teampos.to_s).text.strip
	height = item.at_css(teamhgt.to_s).text.strip
	weight = item.at_css(teamwgt.to_s).text.strip
	age = item.at_css(teamage.to_s).text.strip
	exp = item.at_css(teamexp.to_s).text.strip
	college = item.at_css(teamcollege.to_s).text.strip
	
	namearr = name.split(',').map(&:strip)
	name = namearr[1][0] + "." + namearr[0]
	
	puts jersey.to_s + " | " + name.to_s + " | " + height.to_s + " | " + weight.to_s + " | " + age.to_s + " | " + exp.to_s + " | " + college.to_s 

end
