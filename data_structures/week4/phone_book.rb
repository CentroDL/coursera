class PhoneBook
	attr_accessor :query_count, :book

	def initialize(query_count: 0)
		@query_count = query_count
		@book = {}
	end

	def process_queries
		query_count.times do |i|
			input = gets.split(' ')

			operation = input.shift
			self.send(operation, input)
		end
	end

	def add(args)
		self.book[args[0]] = args[1]
	end

	def del(args)
		self.book.delete(args[0])
	end

	def find(args)
		output = self.book.has_key?(args[0]) ? self.book[args[0]] : 'not found'
		puts output
	end
end

query_count = gets.to_i

phone_book = PhoneBook.new(query_count: query_count)
phone_book.process_queries
