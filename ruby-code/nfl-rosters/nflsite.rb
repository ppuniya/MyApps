 require 'rubygems'
 require 'nokogiri'
 require 'open-uri'

url = "http://www.nfl.com/teams/tennesseetitans/roster?team=TEN"
teammainobj = "tbody"
teamiterobj = "tr"
teamjersey = "td:nth-child(1)"
teamname = "td:nth-child(2)"
teampos = "td:nth-child(3)"
teamstatus = "td:nth-child(4)"
teamhgt = "td:nth-child(5)"
teamwgt = "td:nth-child(6)"
teambday = "td:nth-child(7)"
teamexp = "td:nth-child(8)"
teamcollege = "td:nth-child(9)"


doc = Nokogiri::HTML(open(url))
tablebody = doc.at_css(teammainobj.to_s)
tablebody.css(teamiterobj.to_s).each do |item|
	jersey = item.at_css(teamjersey.to_s).text.strip
	name = item.at_css(teamname.to_s).text.strip
	status = item.at_css(teamstatus.to_s).text.strip
	position = item.at_css(teampos.to_s).text.strip
	height = item.at_css(teamhgt.to_s).text.strip
	weight = item.at_css(teamwgt.to_s).text.strip
	age = item.at_css(teambday.to_s).text.strip
	bday = Date.strptime(age.to_s, '%m/%d/%Y')
	exp = item.at_css(teamexp.to_s).text.strip
	college = item.at_css(teamcollege.to_s).text.strip
	
	namearr = name.split(',').map(&:strip)
	name = namearr[1][0] + "." + namearr[0]
	
	puts jersey.to_s + " | " + name.to_s + " | " + position.to_s + " | "+ status.to_s + " | " + height.to_s + " | " + weight.to_s + " | " + bday.strftime('%d-%m-%Y') + " | " + exp.to_s + " | " + college.to_s 
	
end
