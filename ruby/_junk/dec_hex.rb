require './user_stdin'

# 16進数に変換したい10進数を標準出力から取得
message = '16進数に変換したい数字を入力してください。'
input = UserStdin.get_user_stdin(message)

input_num1 = input.to_i(10)
if input_num1.kind_of?(Integer)
  puts "10: #{input_num1} --> 16: #{input_num1.to_s(16)} --> 2: #{input_num1.to_s(2)}"
else
  puts "数値を入力してください。"
end

# ビット演算したいビット値を16進数で入力
message = 'ビット積をとる数値を16進数で入力してください。'
input = UserStdin.get_user_stdin(message)

input_num2 = input.to_i(16)
if input_num2.kind_of?(Integer)
  puts "10: #{input_num2} --> 16: #{input_num2.to_s(16)} --> 2: #{input_num2.to_s(2)}"

  puts "$1   : #{input_num1.to_s(2)}"
  puts "$2   : #{input_num2.to_s(2)}"

  # ビット積を取得
  prod = input_num1 & input_num2
  puts "$1&$2: #{prod.to_s(2)}"

else
  puts '数値を入力してください。'
end




