class Image

  def initialize (list_of_numbers)
    @list_of_numbers  = list_of_numbers
  end

  def locate_ones #this will return an array of arrays [[1,1],[2,3]]
    new_array = []
    @list_of_numbers.each_with_index do | row, index_of_row | #example row = [0, 0, 0, 0]
      row.each_with_index do | number, index_of_number | #example number = 0
        if number == 1
          new_array << [index_of_row, index_of_number]
        end
      end
    end
    new_array
  end

  def blur 
    ones = locate_ones
    @list_of_numbers.each_with_index do | row, index_of_row |
      row.each_with_index do | number, index_of_number |
        ones.each do | row_of_one, col_of_one |
          if index_of_row == row_of_one && index_of_number == col_of_one
            @list_of_numbers[index_of_row - 1][index_of_number] = 1 unless index_of_row == 0
            @list_of_numbers[index_of_row + 1][index_of_number] = 1 unless index_of_row >= 3
            @list_of_numbers[index_of_row][index_of_number - 1] = 1 unless index_of_number == 0
            @list_of_numbers[index_of_row][index_of_number + 1] = 1 unless index_of_number >= 3
          end
        end
      end
    end
  end

  def output_image
    @list_of_numbers.each do | list | 
      puts list.join
    end
  end

end

multi_dimensional_array = [
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
]
image = Image.new(multi_dimensional_array)
image.blur
image.output_image
