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
		puts "Now we have #{students.length} students"
		#get another name from the user
		name = gets.chomp
		puts "Which cohort"
		cohort = gets.chomp
	end
	#return the array of students
	students
end

students = input_students
print_header
print(students)
print_footer(students)