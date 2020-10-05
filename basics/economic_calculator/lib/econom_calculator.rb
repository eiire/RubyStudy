require 'csv'

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

  def columns_name
    return "Incorrect data!\n" unless @is_data

    "#{@columns_name.join(',')}\n"
  end

  def max
    return "Incorrect data!\n" unless @is_data

    res = (0..@n_columns).reduce([]) do |res_columns, i|
      res_columns.append (@data_matrix.reduce([]) do |vals_columns, row|
        vals_columns.append row[i]
      end).max
    end

    "#{res.join(',')}\n"
  end

  def min
    return "Incorrect data!\n" unless @is_data

    res = (0..@n_columns).reduce([]) do |res_columns, i|
      res_columns.append (@data_matrix.reduce([]) do |vals_columns, row|
        vals_columns.append row[i]
      end).min
    end

    "#{res.join(',')}\n"
  end

  def find_mean
    return "Incorrect data!\n" unless @is_data

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
    end.join(',')

    "#{mean.join(',')}\n"
  end

  def variance
    return "Incorrect data!\n" unless @is_data

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

    "#{res.join(',')}\n"
  end

  protected

  def numeric?(value)
    !Float(value).nil?
  rescue StandardError
    false
  end

  def to_center
    mean = find_mean.split(',')
    Marshal.load(Marshal.dump(@data_matrix)).each do |row|
      (0..row.length - 1).each do |i|
        row[i] = row[i] - mean[i].to_f # center
        row[i] *= row[i]
      end
    end
  end

  def prepare_data
    @data_matrix = @data_matrix.each do |row|
      (0..@n_columns).each do |i|
        row[i] = row[i].split(',').join('.')
        if numeric? row[i]
          row[i] = row[i].to_f
        else
          @is_data = false
        end
      end
    end
  end
end
