class Hangman

  def initialize
    @word = words.sample
    @lives = 7
    @word_teaser = ""

    @word.first.size.times do
      @word_teaser += "_ "
    end
  end

  def words
    [
      ["dog", "Has four paws and is always with you."],
      ["cat", "Beautiful pet, but not always in the mood to play."],
      ["scp", "A secret facility where paranormal entities are stored."],
      ["youtube", "You watch it everyday."],
      ["twitch", "Most people prefer to stream live here than on YouTube."],
      ["minecraft", "The world of this game is made only of squares."],
      ["mosquito", "Is your worst nightmare - it flies over your head and keeps you awake, and when the time is right, it starts drinking your blood."],
      ["milk", "It makes your bones stronger."],
      ["python", "The most popular programming language in the world. It has two snakes on icon."],
      ["swift", "Programming language created by Apple."],
      ["doom", "Game released in 1993 by id Software."],
      ["half-life", "First game ever released by Valve."],
      ["fish", "Swims in the water."]
    ]
  end

  def print_teaser last_guess = nil
    update_teaser(last_guess) unless last_guess.nil?
    puts @word_teaser
  end

  def update_teaser last_guess
    new_teaser = @word_teaser.split

    new_teaser.each_with_index do |letter, index|
      # replace blank values with guessed letter if matches letter in word
      if letter == '_' && @word.first[index] == last_guess
        new_teaser[index] = last_guess
      end
    end

    @word_teaser = new_teaser.join(' ')
  end

  def make_guess
    if @lives > 0
      puts "Enter a letter or '-':"
      guess = gets.chomp

      good_guess = @word.first.include? guess

      if guess.length > 1
        puts "Guess a maximum of one letter per turn."
        make_guess

      elsif good_guess
        puts "You are correct!"

        print_teaser guess

        if @word.first == @word_teaser.split.join
          puts "Congratulations! You have won this round!"
        else
          make_guess
        end
      else
        @lives -= 1
        puts "Nice try! You have #{ @lives } lives left. Try again!"
        make_guess
      end
    else
      puts ""
    end
  end

  def begin
    # ask user for a letter
    puts "New game started! your word is #{ @word.first.size } characters long"
    print_teaser

    puts "Clue: #{ @word.last }"

    make_guess
  end

end

game = Hangman.new
game.begin
