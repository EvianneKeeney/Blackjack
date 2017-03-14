# allow(blackjack).to receive(:gets)
require "spec_helper"

RSpec.describe Blackjack do
  let(:blackjack) { Blackjack.new }
  describe "#new" do
    it "should start with a deck, a player hand, and a dealer hand" do
      expect(blackjack.deck).to be_a Deck
      expect(blackjack.player_hand).to be_a Hand
      expect(blackjack.dealer_hand).to be_a Hand
    end
  end

  describe "#build_deck" do
    it "should build a deck of 52 cards" do
      expect(blackjack.deck.cards.size).to eq 52
    end

    it "creates unique cards" do
      expect(blackjack.deck.cards.uniq.size).to eq 52
    end

    it "shuffles deck after being built" do
      expect(blackjack.deck.cards.shuffle).to_not eq blackjack.deck.cards
    end
  end

  describe "#deal_cards" do
    it "should deal two card to the player and the dealer" do
      expect(blackjack.player_hand).to eq(Hand.new([Card,Card]))
      expect(blackjack.dealer_hand).to eq(Hand.new([]))
    end
  end

end
