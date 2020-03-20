require_relative 'menu_option_helpers'

# Print menu and get the user selected option
def print_menu()
  puts "Madden's Car Selection Tool-"

  if UserModel.model_id == "N/A"
    puts "NO MODEL SELECTED"
  else 
    print_info()
  end

  # Print Menu Choices
  puts "1. Select a model (E, L, X)"
  puts "2. Display available options and prices"
  puts "3. Add an option"
  puts "4. Remove an option"
  puts "5. Cancel order"
  puts "6. Quit"

  # Get User Choice
  print "Enter choice: "
  new_option = valid_option(gets.chomp)
  return new_option

end

# Checks if option is valid
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

# Menu Formatting Method
def print_info
  # Model
  puts "Model: #{UserModel.model_id}"

  # Options
  print "Selected Options: "

  if UserModel.selected_options == []
    print "(None)\n"
  else
    # Formatting
    i = 0
    print "#{UserModel.selected_options[i].name} ($#{UserModel.selected_options[i].price})"
    while i < UserModel.selected_options.length - 1
        i = i + 1;
        print ", #{UserModel.selected_options[i].name} ($#{UserModel.selected_options[i].price})" 
    end
    puts
  end

  # Price
  puts "TotalPrice: $#{UserModel.total_price}"
end

