require_relative "../../lib/deck"
require 'rspec'

describe Deck do
  let(:deck) { Deck.new }

  describe ".new" do
    it "creates a deck" do
      expect(deck).to be_a(Deck)
    end
  end

  describe "#cards" do
    it "creates a deck with 52 unique cards" do
      expect(deck.cards.length).to eq(deck.cards.uniq.length)
    end
  end

  describe "#deal" do
    it "takes off a given number card" do
      expect(deck.cards.last).to eq(deck.deal(1).last)
    end
  end

end
