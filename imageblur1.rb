class Image

  def initialize (list_of_numbers)
    @list_of_numbers  = list_of_numbers
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
image.output_image
