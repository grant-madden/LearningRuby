require_relative 'menu_option_helpers'

# Print menu and get the user selected option
def print_menu_and_get_selection(user_model)
  puts "Madden's Car Selection Tool-"

  # Print Current Model Info
  if user_model.model_id == nil
    puts "NO MODEL SELECTED"
  else 
    puts "Model: #{user_model.model_id}"
    puts "Selected Options: #{user_model.selected_options_list}"
    puts "TotalPrice: $#{user_model.total_price}"
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
  return valid_menu_selection(gets.chomp)

end

# Checks if option is valid
def valid_menu_selection(user_selection)
  loop do
    # Only Exits loop when valid option
    case user_selection
    when "1", "2", "3", "4", "5", "6"
      return user_selection
    else # Gets new Valid option
      puts "Error, Invalid Option!"
      print "Enter choice (1-6): "
      user_selection = gets.chomp
    end
  end
end


