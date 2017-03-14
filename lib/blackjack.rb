require_relative "card"
require_relative "deck"
require_relative "hand"
class Blackjack
  attr_reader :deck, :player_hand, :dealer_hand
  def initialize
    @deck = Deck.new
    @player_hand = Hand.new(@deck.deal(2))
    @dealer_hand = Hand.new(@deck.deal(2))
  end


  def build_deck
    @deck.build_deck
  end

  def show_player_cards
    count = 0
    @player_hand.cards.each do |show|
      print "#{@player_hand.cards[count].rank}#{@player_hand.cards[count].suit} "
      count += 1
    end
  end

  def show_1_dealer_card
    print "#{@dealer_hand.cards[0].rank}#{@dealer_hand.cards[0].suit} "+"[ ? ]"
  end

  def show_dealer_cards
    index = 0
    @dealer_hand.cards.each do |show|
      print "#{@dealer_hand.cards[index].rank}#{@dealer_hand.cards[index].suit}"
      index += 1
    end
  end

  def calculate_players_total
    @player_hand.calculate_hand
  end

  def calculate_dealers_total
    @dealer_hand.calculate_hand
  end

  def prompt_for_input
    score = 0
    players_turn = true
    while players_turn == true
      puts "Hit or Stand (H/S) "
      choice = gets.chomp
      if @player_hand.calculate_hand == 21
        puts "BLACKJACK"
        players_turn = false
      elsif @player_hand.calculate_hand > 21
        puts "BUST!...Game Over"
        players_turn = false
        exit
      elsif choice.upcase() == 'S'
        puts "Your standing total is #{@player_hand.calculate_hand}"
        puts "\n\n"
        players_turn = false
      else choice.upcase() == 'H'
        @player_hand.cards << @deck.deal(1)
        @player_hand.cards.flatten!
        count = 0
        @player_hand.cards.each do |show|
          print "#{@player_hand.cards[count].rank}#{@player_hand.cards[count].suit} "
          count += 1
        end
        puts "Player total: #{@player_hand.calculate_hand}"
        players_turn = true
        puts "\n\n"
        if @player_hand.calculate_hand > 21
          puts "BUST!...Game over, Dealer Wins."
          exit
        end
      end
    end
  end

  def dealer_play
    while @dealer_hand.calculate_hand < 17
      @dealer_hand.cards << @deck.deal(1)
      @dealer_hand.cards.flatten!
      x = 0
      @dealer_hand.cards.each do |show|
        print "#{@dealer_hand.cards[x].rank}#{@dealer_hand.cards[x].suit} "
        x += 1
      end
      puts "Dealers new total is #{@dealer_hand.calculate_hand}"
    end
    if @dealer_hand.calculate_hand > 21
      puts "BUST...Player wins!"
      exit
    end
  end

end

new_game = Blackjack.new
puts "Welcome to Blackjack!"
puts "\n"
new_game.build_deck
puts "Player's Cards:"
new_game.show_player_cards
puts "\n\n"
puts "Dealer's Cards"
new_game.show_1_dealer_card
puts "\n\n"
puts "Your current total is #{new_game.calculate_players_total}"
new_game.prompt_for_input
puts "Your current total is #{new_game.calculate_players_total}"
puts "Dealer's deck:"
new_game.show_dealer_cards
puts "\n\n"
puts "Dealer's current total is #{new_game.calculate_dealers_total}"
new_game.dealer_play
if new_game.calculate_players_total > new_game.calculate_dealers_total && new_game.calculate_players_total < 21
  puts "Player wins!"
elsif new_game.calculate_players_total == new_game.calculate_dealers_total
  puts "Tied game"
else new_game.calculate_players_total < new_game.calculate_dealers_total && new_game.calculate_dealers_total < 21
  puts "Dealer wins"
end
