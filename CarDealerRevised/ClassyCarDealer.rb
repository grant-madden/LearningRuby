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
  ].each do |opts|
    CarOption.new(opts[0], opts[1])
  end 

  # Creates new model class
  UserModel = CarModel.new

# Menu Option Handlers
#1
def model_select

  new_id = ""
  while new_id != "E" && new_id != "L"  && new_id != "X"
    print "Select a model (E, L, X): "
    new_id = gets.chomp.upcase
  end

  UserModel.model_id = new_id

end

#2
def display_options
  if UserModel.model_id == "N/A"
    puts "You need to select a model before adding options!"
  else
    puts
    puts "Available Options: "
    CarOption.available_options.each {|i| puts i}
  end
end

#3
def add_option_handler
  option_name = option_input("add")
  i = search_available_options(option_name)
  if i == -1
    puts "Error, option \"#{option_name}\" not #{option_status}."
    return
  end
  UserModel.add_option(i)
end

#4
def remove_option_handler
  option_name = option_input("remove")
  i = search_selected_options(option_name)
  if i == -1
    puts "Error, option \"#{option_name}\" #{option_status}."
    return
  end
  UserModel.remove_option(i)
end

# Main
menu_option = 0

while menu_option != "6"
  menu_option = print_menu()

  case menu_option
  when "1"
    model_select()
  when "2"
    display_options()
  when "3"
    add_option_handler()
  when "4"
    remove_option_handler()
  when "5"
    UserModel.cancel_order()
  end
  puts 
end

