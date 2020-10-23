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

def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
    # 2. read the input and ave it into a variable
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
      exit # this will cause the program to terminate
    else
      puts "I don't know what you mean, try again"
    end
  end
end

interactive_menu
