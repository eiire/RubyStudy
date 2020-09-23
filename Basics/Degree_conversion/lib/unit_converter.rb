# frozen_string_literal: true

# instance object may convert C, F, K in degrees
class UnitConverter
  def initialize(user_input)
    data_list = user_input.split(':')
    @convert_from = data_list[0]
    @unit = data_list[1].to_f
  end

  def to_c
    if @convert_from == 'F'
      ((@unit - 32) / 1.8).round(4)
    elsif @convert_from == 'K'
      @unit.negative? ? raise('Incorrect value for scale K') : (@unit - 273).round(4)
    end
  end

  def to_k
    if @convert_from == 'C'
      (@unit + 273).round(4)
    elsif @convert_from == 'F'
      (((@unit - 32) * 1.8) + 273.15).round(4)
    end
  end

  def to_f
    if @convert_from == 'C'
      (@unit * 1.8 + 32).round(4)
    elsif @convert_from == 'K'
      @unit.negative? ? raise('Incorrect value for scale K') : ((@unit - 273.15) * 1.8 + 32).round(4)
    end
  end
end
