require_relative 'car_model'

# Adds all options
[['Leather Seats', 5000], 
 ['DVD System', 1000], 
 ['10 Speakers', 800], 
 ['Navigation System',1400], 
 ['CarPlay', 500], 
 ['Android Auto', 500], 
 ['Lane Monitoring', 2000]
].each do |opts|
  CarOption.new(opts[0], opts[1])
end



# Class Initialization
SelectedModel = CarModel.new

# Print menu and get the user selected option
def print_menu()
  puts "Madden's Car Selection Tool-"

  if SelectedModel.model_id = "N/A"
    puts "NO MODEL SELECTED"
  else 
    puts "Model: #{SelectedModel.model_id}"
    puts "Model: #{SelectedModel.model_id}"
    puts "TotalPrice: #{SelectedModel.model_id}"
  end

  puts "1. Select a model (E, L, X)"
  puts "2. Display available options and prices"
  puts "3. Add an option"
  puts "4. Remove an option"
  puts "5. Cancel order"
  puts "6. Quit"

  print "Enter choice: "
  new_option = valid_option(gets.chomp)
  return new_option

end

def valid_option(option)
  while true 
    # Only Exits loop when valid option
    case option
    when "1"
      return option
    when "2"
      return option
    when "3"
      return option
    when "4"
      return option
    when "5"
      return option
    when "6"
      return option
    else # Gets new Valid option
      puts "Error, Invalid Option!"
      print "Enter choice (1-6): "
      option = gets.chomp
    end
  end
end

# Main
menu_option = 0
while menu_option != "6"
  menu_option = print_menu()
  case menu_option
  when "1"
    puts "1"
  when "2"
    puts "2"
  when "3"
    puts "3"
  when "4"
    puts "4"
  when "5"
    puts "5"
  end
end