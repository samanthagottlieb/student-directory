def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []
  name = gets.chomp

  cohorts = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]

  while !name.empty? do
    while true
      puts "What cohort are they in?"
      cohort = gets.chomp.downcase.to_sym

      if cohorts.include? cohort
        cohort
        break
      elsif cohort.empty?
        cohort = :november
        break
      end
    end

    students << {name: name, cohort: cohort, hobby: :trouble}

    if students.count == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{students.count} students"
    end

    name = gets.chomp
  end

  students
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print(students)
  cohorts = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]

  cohorts.each do |cohort|
    students.each do |student|
      if cohort == student[:cohort]
        puts "#{student[:name]} (#{student[:cohort]} cohort, likes #{student[:hobby]})".center(100)
      end
    end
  end
end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have 1 great student".center(100)
  else
    puts "Overall, we have #{students.count} great students".center(100)
  end

end

students = input_students

print_header
print(students)
print_footer(students)
