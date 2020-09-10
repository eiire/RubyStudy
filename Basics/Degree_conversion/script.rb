def main(massage="Hi, enter the unit in format [unit:value] you want to translate with: ")
  puts massage
  user_input = gets.chop
  puts "Hello, enter the unit you want to translate into: "
  convert_to = gets.chop

  puts to_convert_unit(user_input, convert_to)
end

def to_convert_unit(user_input, convert_to)
  data_list = user_input.split(':')
  convert_from, unit = data_list[0], data_list[1].to_i

  if convert_from == "F" and convert_to == "C"
    (unit - 32) / 1.8
  elsif convert_from == "C" and convert_to == "F"
    unit * 1.8 + 32
  elsif convert_from == "C" and convert_to == "K"
    unit + 273
  elsif convert_from == "K" and convert_to == "C"
    if unit >= 0
      unit - 273
    else
      puts "Incorrect input\n"
      main("Try again:")
    end
  elsif convert_from == "K" and convert_to == "F"
    if unit >= 0
      (unit - 273) * 1.8 + 32
    else
      puts "Incorrect input"
      main("Try again:")
    end
  elsif convert_from == "F" and convert_to == "K"
    ((unit - 32) / 1.8) + 274
  end
end

main
