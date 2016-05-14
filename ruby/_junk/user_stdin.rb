module UserStdin
  def UserStdin.get_user_stdin(message)
    puts message
    while inputLine = STDIN.gets
      break if inputLine.chomp == "exit"
      return inputLine.chomp
    end
  end
end

