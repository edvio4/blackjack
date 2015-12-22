require_relative "../../lib/blackjack"
require 'rspec'
require 'pry'

describe Blackjack do
  let(:blackjack) { Blackjack.new }
  let(:player_hand) { Hand.new(["6♠", "A♥", "K♦"], "Player") }
  let(:dealer_hand) { Hand.new(["6♠", "A♥", "K♦", "A♣"], "Dealer") }


  describe ".new" do
    it "runs blackjack game" do
      expect(blackjack).to be_a(Blackjack)
    end
  end
  
  describe "#output_hand" do
    it "outputs player's hand" do
      output = ""
      player_hand.cards.each { |card| output+="#{player_hand.name} was dealt #{card.card}\n" }
      expect { blackjack.output_hand(player_hand) }.to output(output).to_stdout
    end
  end

  describe "#output_score" do
    it "outputs player's score" do
      player_hand.calculate_hand
      expect { blackjack.output_score(player_hand) }.to output("#{player_hand.name} score: #{player_hand.score}\n").to_stdout
    end
  end

  describe "#output_dealt_card" do
    it "outputs player's dealt card" do
      expect { blackjack.output_dealt_card(player_hand) }.to output("#{player_hand.name} was dealt #{player_hand.cards.last.card}\n").to_stdout
    end
  end

  describe "#hit" do
    it "adds card to hand" do
      expect ()
    end
  end




end
