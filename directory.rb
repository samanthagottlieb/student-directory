@students = []
@cohorts = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  name = gets.chomp

  while !name.empty? do
    while true
      puts "What cohort are they in?"
      cohort = gets.chomp.downcase.to_sym

      if @cohorts.include? cohort
        cohort
        break
      elsif cohort.empty?
        cohort = :november
        break
      end
    end

    @students << {name: name, cohort: cohort, hobby: :trouble}

    if @students.count == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{@students.count} students"
    end

    name = gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print_students_list
  @cohorts.each do |cohort|
    @students.each do |student|
      if cohort == student[:cohort]
        puts "#{student[:name]} (#{student[:cohort]} cohort, likes #{student[:hobby]})".center(100)
      end
    end
  end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have 1 great student".center(100)
  else
    puts "Overall, we have #{@students.count} great students".center(100)
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of save_students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobby]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

interactive_menu
