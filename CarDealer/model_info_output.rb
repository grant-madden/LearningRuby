def print_info
  # Model
  puts "Model: #{SelectedModel.model_id}"

  # Options
  print "Selected Options: "

  if SelectedModel.selected_options == []
    print "(None)\n"
  else
    # Formatting
    i = 0
    print "#{SelectedModel.selected_options[i].name} ($#{SelectedModel.selected_options[i].price})"
    while i < SelectedModel.selected_options.length - 1
        i = i + 1;
        print ", #{SelectedModel.selected_options[i].name} ($#{SelectedModel.selected_options[i].price})" 
    end
    puts
  end

  # Price
  puts "TotalPrice: $#{SelectedModel.total_price}"
end