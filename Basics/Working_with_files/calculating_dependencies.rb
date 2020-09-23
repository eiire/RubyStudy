# frozen_string_literal: true

require 'csv'

class String
  def numeric?
    !Float(self).nil?
  rescue StandardError
    false
  end
end

class EconomCalculator
  def initialize(file_name)
    @is_data = true
    @file_name = file_name
    @n_columns = CSV.read(file_name)[0].length - 1
    @n_rows = CSV.read(file_name).length - 1
    @data_matrix = CSV.read(file_name)
    @columns_name = @data_matrix[0..0][0]
    @data_matrix = @data_matrix[1..@n_rows]

    @data_matrix = @data_matrix.each do |row|
      (0..@n_columns).each do |i|
        row[i] = row[i].split(',').join('.')
        if row[i].numeric?
          row[i] = row[i].to_f
        else
          @is_data = false
        end
      end
    end
  end

  def columns_name
    return 'Incorrect data!' + "\n" unless @is_data

    @columns_name.join(',') + "\n"
  end

  def max
    return 'Incorrect data!' + "\n" unless @is_data

    res = []
    (0..@n_columns).each do |i|
      vals_columns = []
      @data_matrix.each do |row|
        vals_columns.append row[i]
      end
      res.append vals_columns.max
    end

    res.join(',') + "\n"
  end

  def min
    return 'Incorrect data!' + "\n" unless @is_data

    res = []
    (0..@n_columns).each do |i|
      vals_columns = []
      @data_matrix.each do |row|
        vals_columns.append row[i]
      end
      res.append vals_columns.min
    end

    res.join(',') + "\n"
  end

  def find_mean
    return 'Incorrect data!' + "\n" unless @is_data

    mean = []
    (0..@n_columns).each do |_|
      mean.append(0)
    end

    @data_matrix.each do |row|
      (0..row.length - 1).each do |i|
        mean[i] += row[i]
      end
    end

    (0..@n_columns).each do |i|
      mean[i] /= @n_rows
    end

    mean.join(',') + "\n"
  end

  def variance
    return 'Incorrect data!' + "\n" unless @is_data

    mean = find_mean.split(',')
    @data_matrix.each do |row|
      (0..row.length - 1).each do |i|
        row[i] = row[i] - mean[i].to_f # центрируем
        row[i] *= row[i]
      end
    end

    res = []
    (0..@n_columns).each do |_|
      res.append(0)
    end

    @data_matrix.each do |row|
      (0..@n_columns).each do |i|
        res[i] += row[i]
      end
    end

    (0..@n_columns).each do |i|
      res[i] /= @n_rows - 1
      res[i] = res[i].round(4)
    end

    res.join(',') + "\n"
  end
end

data = EconomCalculator.new('demo32.csv')
print data.columns_name
print data.min
print data.max
print data.find_mean
print data.variance
