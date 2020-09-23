class UnitConverter
  def initialize(user_input)
    data_list = user_input.split(':')
    @convert_from = data_list[0]
    @unit = data_list[1].to_f
  end

  def to_c
    case @convert_from
    when 'F'
      ((@unit - 32) / 1.8).round(4)
    when 'K'
      @unit.negative? ? raise('Incorrect value for scale K') : (@unit - 273).round(4)
    else
      'Incorrect input!'
    end
  end

  def to_k
    case @convert_from
    when 'C'
      (@unit + 273).round(4)
    when 'F'
      (((@unit - 32) * 1.8) + 273.15).round(4)
    else
      'Incorrect input!'
    end
  end

  def to_f
    case @convert_from
    when 'C'
      (@unit * 1.8 + 32).round(4)
    when 'K'
      @unit.negative? ? raise('Incorrect value for scale K') : ((@unit - 273.15) * 1.8 + 32).round(4)
    else
      'Incorrect input!'
    end
  end
end
