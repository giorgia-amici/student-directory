def print_header
	puts "Students now "
	puts "-------------------"
end


def print(students)
	students.each_with_index do |student, index|
	puts "#{index + 1}: #{student[:name]} (#{student[:cohort]} cohort)"

	end
end


def print_footer(names)
	puts "Overall, we have #{names.length} students"
end

def input_students
	puts "Please enter the names of students"
	puts "To finish, just hit return twice"
	#create the empty array that will store th students' names
	students = []
	#get the first name
	name = gets.chomp
	puts "Whcih cohort?"
	cohort = gets.chomp
	#while the name is not empty, repeat this code
	while !name.empty? do
		#add the student hash to the array
		students << {:name => name, :cohort => cohort}
		puts "Now we have #{students.length} student"
		#get another name from the user
		name = gets.chomp
		puts "Which cohort"
		cohort = gets.chomp
	end
	#return the array of students
	students
end


def interactive_menu
	students = []
	loop do
	# 1. print the menu and ask the user what to do
	puts "1. Input the students"
	puts "2. Show the students"
	puts "9. Exit"
	# 2. read the input and save it into a variable
	selection = gets.chomp
	# 3. do what the user has asked
	case selection
	when "1"
		students = input_students
	when "2"
		print_header
		print(students)
		print_footer(students)
	when "9"
		exit #this will cause the programm to terminate
	else
		puts "I don't know what you meant, try again"
	end
	end
end 

interactive_menu


