require_relative 'car_option'
require_relative 'car_model'
require_relative 'car_package'
require_relative 'menu_display'

# Class Initialization
# Adds all options to option class
[['Leather Seats', 5000], 
['DVD System', 1000], 
['10 Speakers', 800], 
['Navigation System',1400], 
['CarPlay', 500], 
['Android Auto', 500], 
['Lane Monitoring', 2000]
].each do |(option_name, option_price)|
  CarOption.new(option_name, option_price)
end 

# Creates new model class
user_model = CarModel.new
user_package = CarPackage.new(user_model)

# Displays all available options to purchase
def display_available_options(user_package)
  puts
  if user_package.model_info.has_selected_model?
    puts "Available Options: "
    puts CarOption.available_options_list
  else
    puts "You need to select a model before adding options!"
  end
end

# Gets option input
def option_input(option_action)
  print "Enter an option to #{option_action}: "
  return gets.chomp()
end

# Main
loop do
  input = print_menu_and_get_selection(user_package)
  case input
  when "1"
    user_package.model_info.select_model
  when "2"
    display_available_options(user_package)
  when "3"
    user_package.add_option(option_input("add"))
  when "4"
    user_package.remove_option(option_input("remove"))
  when "5"
    user_package.cancel_order
  when "6"
    exit
  end
  puts 
end

