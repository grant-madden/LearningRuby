# Print menu and get the user selected option

def print_menu()
  puts "Madden's Car Selection Tool-"

  if SelectedModel.model_id == "N/A"
    puts "NO MODEL SELECTED"
  else 
    # Model
    puts "Model: #{SelectedModel.model_id}"
    # Options
    print "Selected Options: "
    if SelectedModel.selected_options == []
      print "(None)\n" 
    else
      print "#{SelectedModel.selected_options}"
    end
    # Price
    puts "TotalPrice: #{SelectedModel.total_price}"
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
