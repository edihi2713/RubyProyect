	

class Game
	attr_reader :oportunities

	def initialize
		@oportunities = []
		load_info
	end

	private
		def load_info
			filename = "info.txt"

			if File.exists?(filename)
				file = File.open(filename)

				file.each_line do |line|
					item = line.split('##')
					definition = item[0].strip.force_encoding(Encoding::UTF_8)
					concept = item[1].strip.force_encoding(Encoding::UTF_8)
					item_hash = {definition: definition, concept: concept}
					add_item(item_hash,@oportunities)
				end
			end
		end

		def add_item(newitem,array)
		  array.push newitem
		end
end

game = Game.new
loaded = game.oportunities.shuffle
limit = loaded.length - 1


puts "Welcome to challenge Five,type in the correct concept for the given definition"

	for i in 0..limit
		puts "Definition: "
		puts "#{loaded[i][:definition]}"
		print "Guess: "
		answer = gets.chomp
		if answer.upcase == loaded[i][:concept].upcase
			puts "Correct"
			print "Woud yo like to keep playing?,Press C to keep going, or press any other letter to exit: "
			decision = gets.chomp
			if decision != "C"
				exit
			else
				next
			end

		else
			puts "InCorrect"
			print "Woud yo like to keep playing?,Press C to keep going, or press any other letter to exit: "
			decision = gets.chomp
			if decision != "C"
				exit
			else
				redo
			end
		end
	
	end

