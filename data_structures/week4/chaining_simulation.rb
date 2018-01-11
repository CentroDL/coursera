# require 'pry'
class ChainingSim

	attr_reader :query_count

	def initialize( cardinality: 0, query_count: 0)
		@query_count = query_count
		@cardinality = cardinality
		@chains      = []
		# @prime       = 1000000007
	end

	def process_requests
		@query_count.times do |i|
			input, argument = gets.split(' ')
			self.send(input, argument)
		end
	end

	def add(str)
		id = hash_string(str)

		if @chains[id]
			return if @chains[id].include?(str)

			@chains[id].unshift(str)
		else
			@chains[id] = [str]
		end
	end

	def del(str)
		id = hash_string(str)

		if @chains[id] && @chains[id].include?(str)
			@chains[id].delete(str)
		end
	end

	def find(str)
		id = hash_string(str)

		if @chains[id] && @chains[id].include?(str)
			puts 'yes'
		else
			puts 'no'
		end
	end

	def check(id)
		id = id.to_i
		output = @chains[id] ? @chains[id].join(' ') : ''

		puts output
	end

	def hash_string(s)
	  sum = s.codepoints.map.with_index { |c, i| c * 263**i }.reduce(&:+)
	  sum % 1000000007 % @cardinality
	end
end


size = gets.to_i
queries = gets.to_i

chaining_sim = ChainingSim.new cardinality: size, query_count: queries
chaining_sim.process_requests