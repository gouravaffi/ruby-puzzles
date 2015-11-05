class CoinSum
	def initialize(coin_list, sum)
		coin_array = coin_list.split(' ').map{|i| i.to_i}
		@coin_set = coin_array.sort.reverse
		@expected_sum = sum.to_i
	end

	def select_coins(coin_set, selected_coins, expected_val)
	  @coin_set.each do |coin|
	    count = (expected_val / coin)
	    expected_val = expected_val % coin
	    count.times{selected_coins << coin}
	  end
	end

	# returns the valid coin set to achieve the desired sum.
	def get_coin_set
		selected_sets = []
		(@coin_set.length + 1).times do |i|
		  selected_coins = []
		  test_coin_set = @coin_set.reject{|j| j == @coin_set[i]}
		  select_coins(test_coin_set, selected_coins, @expected_sum)
		  selected_sets << selected_coins.join(',') if selected_coins.reduce(:+) == @expected_sum
		end		
		puts selected_sets.empty? ? "Coins cannot make up the sum." : selected_sets.last
	end
end

puts "Enter coin set:"
coin_list = gets.chomp

puts "Enter desired sum:"
sum = gets.chomp

coin = CoinSum.new(coin_list, sum)
coin.get_coin_set