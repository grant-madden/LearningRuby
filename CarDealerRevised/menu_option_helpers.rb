
def option_input(option_action)
  print "Enter an option to #{option_action}: "
  return gets.chomp()
end

# Search all options
def search_available_options(target)
    CarOption.available_options.each do |i|
      # Case insensitivity
      target_lowered = target.downcase
      i_lowered = i.name.downcase
      # Linear Search
      if i_lowered == target_lowered
        return i
      end
    end
  return nil
end

def search_selected_options(user_model, target)
  user_model.selected_options.each do |i|
    # Case insensitivity
    target_lowered = target.downcase
    i_lowered = i.name.downcase
    # Linear Search
    if i_lowered == target_lowered
      return i
    end
  end
  return nil
end