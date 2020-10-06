require 'csv'
require_relative 'econ_calc_mixin'

class EconomCalculator
  def initialize(file_name)
    @is_data = true
    @file_name = file_name
    @n_columns = CSV.read(file_name)[0].length - 1
    @n_rows = CSV.read(file_name).length - 1
    @data_matrix = CSV.read(file_name)
    @columns_name = @data_matrix[0..0][0]
    @data_matrix = @data_matrix[1..@n_rows]

    prepare_data
  end

  def to_columns_name
    return "Incorrect data!\n" unless @is_data

    @columns_name
  end

  def find_max(col = 'blank')
    return "Incorrect data!\n" unless @is_data

    if col == 'blank'
      (0..@n_columns).reduce([]) do |res_columns, i|
        res_columns.append (@data_matrix.reduce([]) do |vals_columns, row|
          vals_columns.append row[i]
        end).max
      end
    else
      find_max_column(col)
    end
  end

  def find_min(col = 'blank')
    return "Incorrect data!\n" unless @is_data

    if col == 'blank'
      (0..@n_columns).reduce([]) do |res_columns, i|
        res_columns.append (@data_matrix.reduce([]) do |vals_columns, row|
          vals_columns.append row[i]
        end).min
      end
    else
      find_min_column(col)
    end
  end

  def find_mean(col = 'blank')
    return "Incorrect data!\n" unless @is_data

    if col == 'blank'
      mean = (0..@n_columns).reduce([]) do |init, _|
        init.append(0)
      end

      @data_matrix.each do |row|
        (0..row.length - 1).each do |i|
          mean[i] += row[i]
        end
      end

      mean.map! do |res_column|
        (res_column / @n_rows).round(4)
      end
    else
      find_mean_column(col)
    end
  end

  def find_variance(col = 'blank')
    return "Incorrect data!\n" unless @is_data

    if col == 'blank'
      res = (0..@n_columns).reduce([]) do |init, _|
        init.append(0)
      end

      to_center.each do |row|
        (0..@n_columns).each do |i|
          res[i] += row[i]
        end
      end

      res.map! do |res_column|
        (res_column / (@n_rows - 1)).round(4)
      end
    else
      find_variance_column(col)
    end
  end

  include EconCalcMixin
end
