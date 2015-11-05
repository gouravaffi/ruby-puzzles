class RecOverlap
	def initialize(first_rec_vertices, sec_rec_vertices)
		@a = first_rec_vertices.split(' ').map{|i| i.to_i}
		@b = sec_rec_vertices.split(' ').map{|i| i.to_i}
	end

	# checks whether the two entered rectangles overlap or not
	# output => boolean
	def is_overlapped?
		overlapped = ((@a[5] <= @b[1]) && (@a[1] >= @b[5]) &&
    (@a[4] >= @b[0]) && (@a[0] <= @b[4]))

	  return overlapped
	end
end


puts "Enter the vertex of first rectangle(starting from top left, clockwise separated by spaces.):"
first_rec_vertex_array = gets.chomp

puts "Enter the vertex of second rectangle(starting from top left, clockwise separated by spaces.):"
sec_rec_vertex_array = gets.chomp

rect = RecOverlap.new(first_rec_vertex_array, sec_rec_vertex_array)
result = rect.is_overlapped?

overlap_verb = result ? "do" : "do not"
puts "The two entered rectangles #{overlap_verb} overlap."

#Sample input-output:
	# Enter the vertex of first rectangle(starting from top left, separated by spaces.):
	# 1 3 3 3 1 2 3 2 
	# Enter the vertex of second rectangle(starting from top left, separated by spaces.):
	# 2 3 4 3 2 2 4 2
	# "The two entered rectangles do overlap."