require 'byebug'

def bubble_sort(number)
  num = number.count  
  num.times do |n| 
    (num - 1 - n).times do |f|
      number[f + 1],number[f] = number[f],number[f + 1] if number[f] < number[f + 1]
    end
  end
  number
end
numbers = [10, 8, 3, 5, 2, 4, 11, 18, 20, 33]

p bubble_sort(numbers)
