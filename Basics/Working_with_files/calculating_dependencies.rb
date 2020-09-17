# frozen_string_literal: true

require 'csv'

# @param [Array] matrix_data
# @param [Integer] n_rows
# @param [Integer] n_columns
# @return [Array]
def find_mean(matrix_data, n_rows, n_columns)
  mean = []
  (0..(n_columns - 1)).each do |_|
    mean.append(0)
  end

  matrix_data.each do |row|
    (0..row.length - 1).each do |i|
      mean[i] += row[i].to_f
    end
  end

  (0..(n_columns - 1)).each do |i|
    mean[i] /= n_rows
  end

  mean
end

# @param [Array] matrix_data
# @param [Array] mean
# @param [Integer] n_columns
# @param [Integer] n_rows
# @return [Array]
def variance(matrix_data, mean, n_columns, n_rows)
  matrix_data.each do |row|
    (0..row.length - 1).each do |i|
      row[i] = row[i].to_f - mean[i].to_f # центрируем
      row[i] *= row[i]
    end
  end

  res = []
  (0..(n_columns - 1)).each do |_|
    res.append(0)
  end

  matrix_data.each do |row|
    (0..row.length - 1).each do |i|
      res[i] += row[i]
    end
  end

  (0..(n_columns - 1)).each do |i|
    res[i] /= n_rows - 1
    res[i] = res[i].round(4)
  end

  res
end

# data preparation
n_columns = CSV.read('demo32.csv').shift.length
n_rows = CSV.read('demo32.csv').length
data_matrix = CSV.read('demo32.csv').each do |row|
  (0..n_columns - 1).each do |i|
    row[i] = row[i].split(',').join('.')
  end
end

print 'max - ', CSV.read('demo32.csv').max
puts ';'
print 'min - ', CSV.read('demo32.csv').min
puts ';'
print 'mean - ', find_mean(data_matrix, n_rows, n_columns)
puts ';'
print 'variance - ', variance(data_matrix, find_mean(data_matrix, n_rows, n_columns), n_columns, n_rows)
