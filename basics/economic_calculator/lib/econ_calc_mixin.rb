module EconCalcMixin
  protected

  def numeric?(value)
    !Float(value).nil?
  rescue StandardError
    false
  end

  def to_center(col = 'blank')
    if col == 'blank'
      mean = find_mean
      Marshal.load(Marshal.dump(@data_matrix)).each do |row|
        (0..row.length - 1).each do |i|
          row[i] = row[i] - mean[i] # center
          row[i] *= row[i]
        end
      end
    else
      to_center_column(col)
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

  def find_index_column(col)
    @columns_name.find_index(col)
  end

  def find_variance_column(col)
    (to_center_column(col).reduce(:+) / (@n_rows - 1)).round(4)
  end

  def find_mean_column(col)
    ((@data_matrix.reduce(0) do |col_mean, row|
      col_mean + row[find_index_column(col)]
    end) / @n_rows).round(4)
  end

  def find_min_column(col)
    (@data_matrix.reduce([]) do |vals_columns, row|
      vals_columns.append row[find_index_column(col)]
    end).min
  end

  def find_max_column(col)
    (@data_matrix.reduce([]) do |vals_columns, row|
      vals_columns.append row[find_index_column(col)]
    end).max
  end

  def to_center_column(col)
    mean = find_mean_column(col)
    @data_matrix.map do |row|
      (row[find_index_column(col)] - mean)**2
    end
  end
end
