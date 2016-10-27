require 'pry'

def menu
puts 'Welcome to the Ruby Calculator!'
puts 'Type quit to exit'
first_number
end

def first_number
	puts 'What is your first number?'
	begin
		@first = user_input
		if @first  == 'quit'
			exit
		end
		@first = Float(@first)
		operator
	rescue
		puts "Invalid number. Try again!" 
		retry # goes back to begin
	end
end

def operator
	puts "What is your operator?"
	puts "| + | - | * | / | c |"
	@op = user_input
	if @op == 'c'
		first_number
	else
		check_op
	end
end

def check_op 
	if @operators.include?(@op)
		second_number
	else 
		puts "Invalid Operator"
		operator
	end
end

def second_number
	puts 'What is your second number?'
	begin
		@second = user_input
				if @first  == 'quit'
			exit
		end
		@second = Float(@second)
		result
	rescue 
		puts "Invalid number. Try again!"
		retry
	end
end

def user_input
	gets.strip
end 

def result 
	puts "Calculating..."
	puts "The result of #{@first} #{@op} #{@second} = "
	case @op
		when '+'
			# puts total = first + second
			total = @first + @second 
			# operator 
		when '-'
			total = @first - @second
		when '*'
			total = @first * @second
		when '/'
			if @second == 0
				puts 'You cant divide by 0. Try again!'
				first_number
			else
				total = @first / @second
			end
		else
			puts "Sorry, I dont work with #{@op}. Please try again."
	end
	puts total
	@first = total
	operator 
end	

@operators = ['+', '-', '*', '/']

menu
