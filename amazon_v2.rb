class Library
		def initialize(books)
				@books = books
		end

		attr_accessor :books
end

class Book
		def initialize(id, name, genre, price, author)
				@id = id
				@name = name
				@genre = genre
				@price = price
				@author = author
		end

		attr_accessor :id, :name, :genre, :price, :author

		def self.all()
				ObjectSpace.each_object(self).to_a
		end

end

class User
		def initialize(name, cart)
				@name = name
				@cart = cart
		end

		attr_accessor :name, :cart

end

class Cart
		def initialize(books)
				@books = books
		end

		attr_accessor :books

end


book1 = Book.new(1, "Book1", "Fiction", 100, "Jim")
book2 = Book.new(2, "Book2", "Fiction", 50, "Sam")
book3 = Book.new(3, "Book3", "Self-help", 30, "Kim")
book4 = Book.new(4, "Book4", "Fiction", 100, "Jim")
book5 = Book.new(5, "Book5", "Self-help", 50, "Tim")
book6 = Book.new(6, "Book6", "Biography", 20, "Kim")
book7 = Book.new(7, "Book7", "Biography", 25, "Sam")
book8 = Book.new(8, "Book8", "Business", 12, "Kim")
book9 = Book.new(9, "Book9", "Business", 50, "Nat")

library = Library.new(Book.all)
books_array = []

answer = "m"

count_books = {
		"Fiction": 0,
		"Self-help": 0
    "Biography": 0,
    "Business": 0,
}

def find_and_display_genre_with_max_count(count_books)
		key_with_max = "Fiction"
		max_count = count_books[key_with_max]
		count_books.each do |genre, count|
				if count > max_count
						max_count = count
						key_with_max = genre
				end
		end
		puts
		puts "found that genre #{key_with_max} has the highest count of #{max_count}"
		Book.all.each do |item|
				if item.genre == key_with_max
						puts item.id
						puts item.name
						puts item.genre
						puts item.price
				end
		end
end

total = 0
while answer == "m" do
		puts "Enter your choice 1. Browse catalog 2. Recommend books 3. Exit"
		choice = gets.chomp.to_i
		puts
		case choice
		when 1
				Book.all.each do |item|
						puts "=" * 20
						puts "Id : #{item.id}"
						puts "Title :#{item.name}"
						puts "Price :#{item.price}"
						puts "Price :#{item.genre}"
						puts "Price :#{item.author}"
				end
		when 2
				puts
				count_books["Fiction"] = books_array.select{|a| a.genre == "Fiction"}.count
				count_books["Self-help"] = books_array.select{|a| a.genre == "Self-help"}.count
				count_books["Biography"] = books_array.select{|a| a.genre == "Biography"}.count
				count_books["Business"] = books_array.select{|a| a.genre == "Business"}.count

				find_and_display_genre_with_max_count(count_books)

		when 3
				abort
		end
		puts
		puts "Which book would you like to buy (Enter ID):?"
		id = gets.chomp.to_i

		Book.all.each do |book|
				if book.id == id
						total = total + book.price
				end
		end
		puts
		Book.all.each do |item|
				if item.id == id
						puts item.id
						puts item.name
						puts item.genre
						puts item.price
						books_array << item
				end
		end

		puts
		puts "Press M to go back to the menu, and C to checkout"
		answer = gets.chomp.downcase
		puts
		if answer == "c"
				puts
				puts "your total is : #{total}"
		end
end

cart = Cart.new(books_array)
user1 = User.new("User", cart)
