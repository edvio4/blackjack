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

    # it "determines score of player hand" do
    #   allow(blackjack).to receive(:gets).and_return("h")
    #   expect(blackjack.player_turn(player_hand)).to eq(Blackjack)
    # end
  end

  describe "#output_hand" do
    it "outputs player's hand" do
      expect { blackjack.output_hand(player_hand) }.to output("Player was dealt 6♠\nPlayer was dealt A♥\nPlayer was dealt K♦\n").to_stdout
    end
  end

  describe "#output_score" do
    it "outputs player's score" do
      player_hand.calculate_hand
      expect { blackjack.output_score(player_hand) }.to output("Player score: 17\n").to_stdout
    end
  end





end
