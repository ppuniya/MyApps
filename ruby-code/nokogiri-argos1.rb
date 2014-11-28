require 'mechanize'

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
searchstr = "coffee table"
agent = Mechanize.new
agent.get("http://www.argos.co.uk/static/Home.htm")

form = agent.page.forms.first
form.searchTerm = searchstr
form.submit
products = agent.page.search(".product")
titles = []
products.each {|p| titles << p.at(".title")}
prices = []
products.each {|p| prices << p.at(".main")}
prices1 = []
prices.each {|p| prices1 << p.text.strip.gsub(/[^0-9\.]/, '').to_f}
titles1 = []
titles.each {|t| titles1 << t.text.strip}
(1..titles1.count).each do |j|
	puts "#{titles1[j-1]} - #{prices1[j-1]} - #{levenshtein(titles1[j-1], searchstr)}"
end
