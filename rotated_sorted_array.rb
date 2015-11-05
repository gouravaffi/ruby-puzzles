class RotatedSortedArray
	def initialize(array)
		@src_array = array.split(' ').map{|i| i.to_i}
	end

	# returns the minimum number in the given array
	def get_minimum_number
	  start = 0
	  last = @src_array.length-1

		while(@src_array[start] > @src_array[last])
			mid = start + (last-start)/2
			if (@src_array[mid] > @src_array[last])
				start = mid+1
			else
				last = mid
			end
		end
		return @src_array[start]
	end
end

puts "Enter the array(elements separated by space):"
input_array = gets.chomp

rot_array = RotatedSortedArray.new(input_array)

result = rot_array.get_minimum_number
puts "The minimum element in the given rotated sorted array is #{result}."



