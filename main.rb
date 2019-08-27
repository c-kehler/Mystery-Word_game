class Word
  attr_accessor :displaying_word

  def initialize(word)
    @word = word
    @array_of_letters = @word.split("")
    @displaying_word = "_" * @word.length
  end

  def guess?(letter)
    if (@word.include?(letter))
      arr_of_indicies = []
      arr_of_indicies = @array_of_letters.each_index.select do |i|
        @array_of_letters[i] == letter
      end
      arr_of_indicies.each do |index|
        @displaying_word[index] = letter
      end
      return true
    else
      return false
    end
  end

  def guessed_all_correct?
    if @displaying_word == @word
      puts "Congradulations you win!"
      return true
    else
      return false
    end
  end

  def output_word
    puts @displaying_word
  end

  def self.is_letter?(character)
  end
end

class MysteryWordGame
  attr_accessor :word

  def initialize
    @lives = 10
    @word
  end

  def ask_for_word
    puts "enter a word"
    word_to_guess = gets.chomp
    @word = Word.new(word_to_guess)
  end

  def game_loop
    game_over = false
    while @lives > 0 && game_over == false
      puts "enter letter"
      letter_guessed = gets.chomp
      if @word.guess?(letter_guessed)
        @word.output_word
      else
        @lives -= 1
        puts "you lose a life, you have #{@lives} remaining"
        if @lives == 0
          puts "You lost"
        end
      end
      game_over = @word.guessed_all_correct?
    end
  end
end

game = MysteryWordGame.new
game.ask_for_word
game.game_loop
