def bubble_sort(array)
  working_array = array.clone
  element_count = working_array.length
  element_count.times do |i|
    0.upto(element_count-i-2) do |j|
      if working_array[j] > working_array[j+1]
        working_array[j], working_array[j+1] = working_array[j+1], working_array[j]
      end
    end
  end
  working_array
end

def bubble_sort_by(array)
  working_array = array.clone
  element_count = working_array.length
  element_count.times do |i|
    0.upto(element_count-i-2) do |j|
      comparison_result = yield(working_array[j], working_array[j+1])
      if comparison_result > 0
        working_array[j], working_array[j+1] = working_array[j+1], working_array[j]
      end
    end
  end
  working_array
end

p bubble_sort([4,3,78,2,0,2])

arr = bubble_sort_by(["hi","hello","hey"]) do |left,right|
  left.length - right.length
end
p arr