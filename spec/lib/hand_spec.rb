require_relative "../../lib/hand"
require 'rspec'

describe Hand do
  let(:hand) { Hand.new(["6♠", "A♥", "K♦"], "Player") }
  let(:hand1) { Hand.new(["6♠", "A♥", "K♦", "A♣"], "Dealer") }

  describe ".new" do
    it "creates a deck" do
      expect(hand).to be_a(Hand)
    end
  end

  describe "#calculate_hand" do
    it "calculate the score of a hand" do
      expect(hand.calculate_hand).to eq(17)
    end

    it "calculate the score of a hand" do
      expect(hand1.calculate_hand).to eq(18)
    end
  end

  describe "#name" do
    it "calculate the score of a hand" do
      expect(hand.name).to eq("Player")
    end

    it "calculate the score of a hand" do
      expect(hand1.name).to eq("Dealer")
    end
  end

  describe "#score" do
    it "retrieves the current score of hand" do
      hand.calculate_hand
      expect(hand.score).to eq(17)
    end

    it "calculate the score of a hand" do
      hand1.calculate_hand
      expect(hand1.score).to eq(18)
    end
  end

   describe "#add_card" do
    it "adds card object to hand" do
      hand.add_card("10♦")
      temp_hand = [Card.new("6♠"), Card.new("A♥"), Card.new("K♦"), Card.new("10♦")]
      hand.cards.each_with_index do |card, index|
        expect(card.card).to eq(temp_hand[index].card)
      end
    end
  end
end
