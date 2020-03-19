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

# Methods for #1
def model_select

  new_id = ""
  while new_id != "E" && new_id != "L"  && new_id != "X"
    print "Select a model (E, L, X): "
    new_id = gets.chomp.upcase
  end

  SelectedModel.model_id = new_id

end

# Main
menu_option = 0

while menu_option != "6"
  menu_option = print_menu()

  case menu_option
  when "1"
    model_select()
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

