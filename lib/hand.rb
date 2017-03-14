require_relative 'deck'
require_relative 'card'
require 'pry'

class Hand
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def calculate_hand
    score = 0
    aces = 0
    @cards.each do |card|
      if card.face_card?
        score += 10
      elsif card.evaluate_ace?
        score += 11
        aces += 1
      else
        score += card.rank
      end
    end
    while score > 21 && aces > 0
      score -= 10
      aces -= 1
    end
    return score
  end

end

deck = Deck.new
cards = deck.deal(2)
hand = Hand.new(cards)
hand.calculate_hand
