# Ruby code file - All your code should be located between the comments provided.

# Main class module
module DOND_Game
	# Input and output constants processed by subprocesses. MUST NOT change.
	GOES = 5

	class Game
		attr_reader :sequence, :selectedboxes, :openedboxes, :chosenbox, :selectedbox, :turn, :input, :output, :winner, :played, :wins, :losses, :guess, :values, :amounts
		attr_writer :sequence, :selectedboxes, :openedboxes, :chosenbox, :selectedbox, :turn, :input, :output, :winner, :played, :wins, :losses, :guess, :values, :amounts

		def initialize(input, output)
			@input = input
			@output = output
		end
		
		def getinput
			@input.gets.chomp.upcase
		end
		
		def storeguess(guess)
			if guess != ""
				@selectedboxes = @selectedboxes.to_a.push "#{guess}"
			end
		end
		
		# Any code/methods aimed at passing the RSpect tests should be added below.
		
		def start
			@output.puts "Welcome to Deal or No Deal!"
			@output.puts "Designed by: #{self.created_by}"
			@output.puts "StudentID: #{self.student_id}"
			@output.puts "Starting game..."
		end
		
		def created_by
			return "Brian Chan, Mahmoud Adi"
		end
		
		def student_id
			return "51989517, 51879421"
		end

		def displaymenu
			@output.puts "Menu: (1) Play | (2) New | (3) Analysis | (9) Exit"
		end 
		
		def resetgame
			@output.puts "New game..."
			@sequence=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
			@selectedboxes=[]
			@openedboxes=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
			@chosenbox=0
			@selectedbox=0
			@turn=0
			@winner=0
			@played=0
			@wins=0
			@losses=0
			@guess=""
			@values=[0.01,0.10,0.50,1.00,5.00,10.00,50.00,100.00,250.00,500.00,750.00,1000.00,3000.00,5000.00,10000.00,15000.00,20000.00,35000.00,50000.00,75000.00,100000.00,250000.00]
			@amounts=values.clone
		end

		def assignvaluestoboxes
			@sequence=@values.shuffle()	
		end

		def showboxes
			@openedboxes.each_with_index do |e,i|
				@a=i+1
				if e==0
					@output.print "[#{@a}] "
				else
					@output.print "|#{@a}| "
				end
			end
		end

		def showamounts
			@a=amounts.each_slice(amounts.length/2).to_a
			@a[0].each_with_index do |e,i|
				@output.puts "#{e}   #{@a[1][i]}"	
			end	
				
		end

		def removeamount(parameter)
			@i=amounts.index(parameter)
			if @i
				@amounts[@i]="    "	
			end
		end
		
		def setchosenbox(boxnumber)
			if boxnumber >= 1 and boxnumber <=22
				@chosenbox = boxnumber	
			end
		end
		
		def getchosenbox
			return @chosenbox 
		end
		
		def displaychosenbox 
			@output.puts "Chosen box: [#{self.getchosenbox}]"
		end
		
		def displaychosenboxvalue 
			@output.puts "Chosen box: [#{self.getchosenbox}] contains: #{@sequence[self.getchosenbox-1]}"
		end
		
		def displaychosenboxprompt
			@output.puts "Enter the number of the box you wish to keep."
		end	
		
		def displaychosenboxerror
			@output.puts "Error: Box number must be 1 to 22."
		end
		
		def displayanalysis
			@output.puts "Game analysis..."
			@openedboxes.each_with_index do |boxstatus, i|
				if boxstatus == 0
					@output.puts "[#{i+1}] Status: Closed"
				else 
					@output.puts "|#{i+1}| Status: Opened"
				end 	
			end
		end
		
		def boxvalid(guess)
			if guess.to_i >= 1 and guess.to_i <=22
				return 0
			else
				return 1
			end
		end
		
		def showselectedboxes
			@output.puts "Log: #{@selectedboxes.inspect}"
		end	
		# Any code/methods aimed at passing the RSpect tests should be added above.

	end
end


