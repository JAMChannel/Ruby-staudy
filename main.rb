require 'byebug'

@hako = []
@cpus = ["グー", "チョキ", "パー"]
@user = {g: "グー", c: "チョキ", p: "パー"}


def verification(win_lost)
  @hako << win_lost
  hako1 = @hako.select{|n|n.include?("勝ち!") }
  hako2 = @hako.select{|n|n.include?("負け!") }
  puts "#{hako1.count}勝#{hako2.count}敗"
end

def presentation
  puts "結果"
  hako1 = @hako.select{|n|n.include?("勝ち!") }
  hako2 = @hako.select{|n|n.include?("負け!") }
  if hako1 == hako2
    puts "#{hako1.count}勝#{hako2.count}敗で同点"
  elsif hako1.count > hako2.count
    puts "#{hako1.count}勝#{hako2.count}敗であなたの勝ち"
  else
    puts "#{hako1.count}勝#{hako2.count}敗で負け"
  end
end

def janken(num)
  item = gets.chomp.to_sym
  jan_cpu = @cpus[rand(@cpus.count)]
  jan_user = @user[item]
  puts "CPU… #{jan_cpu}"
  puts "あなた…#{jan_user}"
  result(jan_cpu,jan_user,num)
end

def result(jan_cpu,jan_user,num)
    if jan_cpu == jan_user
      puts "あいこで...(press g or c or p)"
      return janken(num)
    elsif (jan_user == @cpus[0] && @cpus[1] == jan_cpu ) || (jan_user == @cpus[1] && @cpus[2] == jan_cpu ) || (jan_user == @cpus[2] && @cpus[0] == jan_cpu )
      puts "勝ち!"
      win_lost = "勝ち!"
    else 
      puts "負け！"
      win_lost = "負け!"
    end
    verification(win_lost)
end


def time_first(num)
  puts "#{num}本目"
  puts "じゃんけん…(press g or c or p)"
  janken(num)
end


while true do
  puts "何本勝負？(press 1 or 3 or 5)"
  input = gets.to_i
  if input == 1
    puts "#{input}本勝負を選びました"
    time_first(input)
  elsif input == 3
    puts "#{input}本勝負を選びました"
    3.times do |i|
      time_first(i += 1)
    end
    presentation
    return true
  elsif input == 5
    puts "#{input}本勝負を選びました"
    5.times do |i|
      time_first(i += 1)
    end
    presentation
    return true
  else
    puts "入力された値は無効です！！もう一回いれて"
  end
end

