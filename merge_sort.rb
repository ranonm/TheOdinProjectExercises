def merge_sort(array)
  return array if array.length < 2

  middle_index = array.length/2
  left_array = merge_sort(array[0...middle_index])
  right_array = merge_sort(array[middle_index..-1])

  merge(left_array, right_array)
end


def merge(left_array, right_array)
  sorted_array = []

  until left_array.empty? || right_array.empty?
    sorted_array << (left_array.first < right_array.first ? left_array.shift : right_array.shift)
  end

  sorted_array += left_array unless left_array.empty?
  sorted_array += right_array unless right_array.empty?

  sorted_array
end

p merge_sort([13, 12, 14, 6, 7, 8])