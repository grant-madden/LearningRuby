# Variables for methods
options = [['Leather Seats', 5000], ['DVD System', 1000], ['10 Speakers', 800], 
  ['Navigation System',1400], ['CarPlay', 500], ['Android Auto', 500], ['Lane Monitoring', 2000]]
selectedOptions = [[''], ]
selectedModel = "N/A"
totalPrice = 0
menuOption = 0

# Printing menu options
def printMenu(selectedModel, totalPrice, selectedOptions)
  puts "Madden's Car Selection Tool -"
  if selectedModel != "E" && selectedModel != "L" && selectedModel != "X"
    puts "No Model Selected"
  else
    puts "Current model:   #{selectedModel}"
    puts "Current price:   $#{totalPrice}"
    
    if selectedOptions == []
      puts "Current options: (none)"
    else
      i = 0
      print "Current options: "
      while i < selectedOptions.length - 1
        print "#{selectedOptions[i][0]}, "
        i = i + 1
      end
        print selectedOptions[i][0]
        puts
    end
  end

  puts "1. Select a model (E, L, X)"
  puts "2. Display available options and prices"
  puts "3. Add an option"
  puts "4. Remove an option"
  puts "5. Cancel order"
  puts "6. Quit"
end

# Option One Methods
def optionOneModel
  print "\nSelect a model: "
  selectedModel = gets.chomp().capitalize

  while selectedModel != "E" && selectedModel != "L" &&    selectedModel != "X"
    puts "Invalid input, select a model (E, L, X): "
    selectedModel = gets.chomp().capitalize
  end
  puts "You selected model #{selectedModel}"
  puts
  selectedModel
end
def optionOnePrice(selectedModel)
  if selectedModel == "X"
    return 1000
  elsif selectedModel == "E"
    return 5000
  else
    return 10000
  end
end

#Option Two Methods
def optionTwo(options)
  i = 0
  puts "\nAvailable Options:"
  while i < options.length
    puts options[i][0]
    i = i + 1
  end
  puts 
end
#Option 3 Methods
def optionThree(selectedModel, options, selectedOptions)
  i = 0
  puts
  if selectedModel == "X" || selectedModel == "E" || selectedModel == "L"
    print "Enter an option to add: "
    addOption = gets.chomp
    while i < options.length
      if options[i][0] == addOption
        selectedOptions.push(options[i])
        return selectedOptions
      end
      i = i + 1
    end 
    puts "Invalid input, option not currently available"
  else
    puts "You must select a model before you add any options!"
  end
  puts
  selectedOptions
end

# Prints menu and gets user input
printMenu(selectedModel, totalPrice, selectedOptions)
print "Enter a menu option: "
menuOption = gets.chomp()

while menuOption != "6"
  if menuOption == "1"
    selectedModel = optionOneModel()
    totalPrice = optionOnePrice(selectedModel)
    tmp = []
    selectedOptions = tmp
    printMenu(selectedModel, totalPrice, selectedOptions)
    print "Enter a menu option: "
    menuOption = gets.chomp()
  elsif menuOption == "2"
    optionTwo(options)
    printMenu(selectedModel, totalPrice, selectedOptions)
    print "Enter a menu option: "
    menuOption = gets.chomp()
  elsif menuOption == "3"
    selectedOptions = optionThree(selectedModel, options, selectedOptions)
    i = 0
    while i < selectedOptions.length
      totalPrice = totalPrice + selectedOptions[i][1]
      i = i + 1
    end
    printMenu(selectedModel, totalPrice, selectedOptions)
    print "Enter a menu option: "
    menuOption = gets.chomp()
  elsif menuOption == "4"
    puts "4"
    printMenu(selectedModel, totalPrice, selectedOptions)
    print "Enter a menu option: "
    menuOption = gets.chomp()
  elsif menuOption == "5"
    puts "5"
    printMenu(selectedModel, totalPrice, selectedOptions)
    print "Enter a menu option: "
    menuOption = gets.chomp()
  else
    puts "Invalid input, enter a menu option:"
    menuOption = gets.chomp()
  end
end

