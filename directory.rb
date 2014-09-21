students = [
	{:name => "Pablo", :cohort =>  :september},
	{:name => "Yorik", :cohort => :october},
	{:name => "Ciaky", :cohort => :january}
	]

def print_header
	puts "Students now "
	puts "-------------------"
end

def print(students)
	students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end

def print_footer(names)
	puts "Overall we have #{names.length} students"
end

print_header
print(students)
print_footer(students)