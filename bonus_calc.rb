def equation_meth 
  puts 'What is the equation you want solved?'
  @equation = gets.strip
  @answer = eval(@equation)
  puts @answer
 
end

  equation_meth