require_relative 'car_option'
require_relative 'car_model'
require_relative 'menu_helpers'

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

# Displays all available options to purchase
def display_available_options(user_model)
  puts
  if user_model.has_selected_model?
    puts "Available Options: "
    puts CarOption.available_options_list
  else
    puts "You need to select a model before adding options!"
  end
end

# Main
loop do
  input = print_menu_and_get_selection(user_model)
  case input
  when "1"
    user_model.select_model
  when "2"
    display_available_options(user_model)
  when "3"
    user_model.add_option(option_input("add"))
  when "4"
    user_model.remove_option(option_input("remove"))
  when "5"
    user_model.cancel_order
  when "6"
    exit
  end
  puts 
end

