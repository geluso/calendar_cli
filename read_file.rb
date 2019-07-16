ff = File.open("input.txt", "r") do |f|
	f.each_line do |line|
		puts line
	end
end
