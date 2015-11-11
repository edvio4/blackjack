require_relative "../../lib/card"
require 'rspec'

describe Card do
  let(:card) { Card.new("10♦") }
  let(:card1) { Card.new("A♣") }
  let(:card2) { Card.new("J♥") }

  describe ".new" do
    it "takes a card as an argument" do
      expect(card).to be_a(Card)
    end
  end

  describe "#suit" do
    it "determine suit of card" do
      expect(card.suit).to eq("diamonds")
    end

    it "determine suit of card" do
      expect(card1.suit).to eq("clubs")
    end

    it "determine suit of card" do
      expect(card2.suit).to eq("hearts")
    end
  end

  describe "#type" do
    it "determine type of card" do
      expect(card.type).to eq("nonface")
    end

    it "determine type of card" do
      expect(card1.type).to eq("ace")
    end

    it "determine type of card" do
      expect(card2.type).to eq("face")
    end
  end

  describe "#value" do
    it "determine value of card" do
      expect(card.value).to eq(10)
    end

    it "determine value of card" do
      expect(card1.value).to eq(nil)
    end

    it "determine value of card" do
      expect(card2.value).to eq(10)
    end
  end


end
