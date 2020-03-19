require_relative 'car_model'
require_relative 'menu_methods'

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
  SelectedModel = CarModel.new

#1
def model_select

  new_id = ""
  while new_id != "E" && new_id != "L"  && new_id != "X"
    print "Select a model (E, L, X): "
    new_id = gets.chomp.upcase
  end

  SelectedModel.model_id = new_id

end

#2
def display_options
  if SelectedModel.model_id == "N/A"
    puts "You need to select a model before adding options!"
  else
    puts
    puts "Available Options: "
    CarOption.available_options.each {|i| puts i}
  end
end

#3
def display_add_option
  print "Enter an option to add: "
  option_name = gets.chomp()
  i = search_available_options(option_name)
  if i == -1
    puts "Error, option \"#{option_name}\" not available."
    return
  end
  SelectedModel.add_option(i) unless i == -1
end

#4


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
    display_add_option()
  when "4"
    puts "4"
  when "5"
    puts "5"
  end
  puts 
end

