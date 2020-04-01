require_relative 'car_option'
require_relative 'car_model'
require_relative 'car_package'
require_relative 'menu_display'

# Main
class MainApp
  def initialize(input: $stdin, output: $stdout)
    @input = input
    @output = output

    # Creates new package class
    @user_package = CarPackage.new(CarModel.new)
  end

  attr_reader :input, :output, :user_package

  MENU_CHOICES = {
    "1" => "Select a model (E, L, X)",
    "2" => "Display available options and prices",
    "3" => "Add an option",
    "4" => "Remove an option",
    "5" => "Cancel order",
    "6" => "Quit",
  }

  def get_input
    # puts "waiting for input..."
    input.gets.chomp.tap do |the_input|
      # puts "received input... #{the_input}"
    end
  end

  def run
    running = true
    while running do
      print_menu
    
      case get_input
      when "1"
        is_selecting_model = true
        new_id = nil
        
        while is_selecting_model
          output.print "Select a model (#{CarModel.available_model_list}): "
          new_id = get_input.upcase
          is_selecting_model = false if CarModel.is_available_model?(new_id)
        end

        user_package.model_info.select_model(new_id)
      when "2"
        display_available_options
      when "3"
        option_to_add = option_input("add")
        user_package.add_option(option_to_add)
      when "4"
        option_to_remove = option_input("remove")
        user_package.remove_option(option_to_remove)
      when "5"
        user_package.cancel_order
      when "6"
        running = false
      else
        output.puts "Error, Invalid Option!"
        output.print "Enter choice (1-6): "
        selection = get_input
      end
      output.puts
    end
  end

  # Displays all available options to purchase
  def display_available_options
    output.puts
    if user_package.model_info.has_selected_model?
      output.puts "Available Options: "
      output.puts CarOptionList.available_options.to_s("\n")
    else
      output.puts "You need to select a model before adding options!"
    end
  end

  # Gets option input
  def option_input(action)
    output.print "Enter an option to #{action}: "
    get_input
  end

  # Print menu and get the user selected option
  def print_menu
    output.puts "Madden's Car Selection Tool-"
    
    # Print Current Model Info
    print_model_info

    # Print Menu Choices
    print_menu_choices

    # Get User Choice
    output.print "Enter choice: "
  end

  def print_menu_choices
    MENU_CHOICES.each do |(option, description)|
      output.puts  "#{option}. #{description}"
    end
  end

  def print_model_info
    if user_package.model_info.has_selected_model?
      output.puts "Model: #{user_package.model_info.id}"
      output.puts "Selected Options: #{user_package.selected_options_list}"
      output.puts "Total Price: $#{user_package.total_price}"
    else 
      output.puts "NO MODEL SELECTED"
    end
  end
    
  # # Checks if option is valid
  # def get_next_selection
  #   selection = get_input
  #   loop do
  #     # Only Exits loop when valid option
  #     case selection
  #     when "1", "2", "3", "4", "5", "6"
  #       return selection
  #     end
  #   end
  # end
end

# Run program outside of Rspec
MainApp.new.run if  __FILE__ == $0