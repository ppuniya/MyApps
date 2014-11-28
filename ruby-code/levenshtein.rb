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


puts levenshtein("Samsung 42 LCD TV", "Articulating TV Wall Mount Dual Arm Swivel Tilt LCD LED 32 37 42 47 50 55 60 65")
puts levenshtein("Samsung 42 LCD TV", "LG 42LN5300 42 1080p LED LCD HDTV, Refurbished")
puts levenshtein("Samsung 42 LCD TV", "Samsung UN40H5500AFXZA 40 1080p Class LED Smart HDTV")
puts levenshtein("Samsung 42 LCD TV", "Samsung PN51F5300BFXZA 51 1080p 600Hz Plasma HDTV")
