require 'prime'

# This is a generic class that calculates and returns the first circular number for a given input digit number.
class CircularPrime
	def initialize(digit)
		@digit = digit
	end

	def set_limits(digit)
		@start_limit = 10**(digit-1)
		@end_limit = 10**digit
	end

	# returns all possible roatation combinations for a number
	def rotations(x)
	  digits = x.to_s.chars
	  digits.map do
	    digits.rotate!.join.to_i
	  end
	end

	# returns first circular prime number for a digit number e.g. four-digit number
	def get_first_circular_prime
		set_limits(@digit)

		# contains all four digit prime numbers 
		valid_primes = Prime.take_while { |x| (x < @end_limit) }.drop_while { |x| (x < @start_limit) }

		valid_primes.each do |n|
  		break n if rotations(n).all?{|r| Prime.prime?(r) }
		end
	end

	def process_input
		if @digit <= 0
			puts "Oops!! Please enter a valid digit number greater than 0."
		else
			first_four_digit_cir_prime = get_first_circular_prime
			puts "The first #{@digit} digit circular number is #{first_four_digit_cir_prime}."
		end
	end
end


puts "Enter the digit number (e.g. 4 for first four-digit number circular prime): "
input_digit_number = gets.chomp.to_i

cir_prime = CircularPrime.new(input_digit_number)
cir_prime.process_input




