def guess
	x = rand(10)
	print "Guess (#{x}) "
	i = gets.to_i
	puts "Correct" if x == i
	puts "Too low" if x > i
	puts "Too high" if x < i
end
