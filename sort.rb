require 'byebug'

def bubble_sort(number)
  num = number.count  
  num.times do |n| 
    # 比較する位置を1つずつ左にずらすため、「- 1 」している
    (num - 1 - n).times do |f|
      # if number[j] > number[j + 1]       # 比較（隣）
        # byebug 
         number[f+1],number[f] = number[f],number[f+1] if number[f] > number[f+1]
        # byebug
      # end
    end
  end
  number
end
numbers = [10, 8, 3, 5, 2, 4, 11, 18, 20, 33]

p bubble_sort(numbers)
