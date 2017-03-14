require_relative 'deck'

class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def face_card?
    if rank == "J" || rank == "Q" ||rank == "K"
      card = 10
    end
  end

  def evaluate_ace?
    if rank == "A"
      card = 11
    end
  end

end
