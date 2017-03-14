require "spec_helper"

describe Hand do
  # These UTF-8 characters will be useful for making different hands:
  # '♦', '♣', '♠', '♥'

  describe "#new" do
    it "should initialize with a starting hand of two card objects" do
      deck = Deck.new
      cards = deck.deal(2)
      hand = Hand.new(cards)
      expect(hand.cards.length).to eq(2)
    end
  end

  describe "calculate_hand" do
    ace = Card.new("A","♦")
    non_ace = Card.new(9,"♦")
    it "should correctly calculate 0 aces" do
      hand = Hand.new([non_ace, non_ace])
      expect(hand.calculate_hand).to eq(18)
    end

    it "should correctly calculate 1 ace as 11" do
      hand = Hand.new([ace, non_ace])
      expect(hand.calculate_hand).to eq(20)
    end

    it "should correctly calculate 1 ace as 1" do
      hand = Hand.new([non_ace, ace, non_ace])
      expect(hand.calculate_hand).to eq(19)
    end

    it "should correctly calculate 2 aces as 1 and 11" do
      hand = Hand.new([ace, ace, non_ace])
      expect(hand.calculate_hand).to eq(21)
    end

    it "should correctly calculate 2 aces as 1 and 1" do
      hand = Hand.new([ace, ace, non_ace, non_ace])
      expect(hand.calculate_hand).to eq(20)
    end

    it "should correctly calculate 3 aces as 1, 1, and 11" do
      hand = Hand.new([ace, ace, ace])
      expect(hand.calculate_hand).to eq(13)
    end

    it "should correctly calculate 3 aces as 1, 1, and 1" do
      hand = Hand.new([ace, ace, ace, non_ace])
      expect(hand.calculate_hand).to eq(12)
    end

  end
end
