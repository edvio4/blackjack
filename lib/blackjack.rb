require 'pry'
require_relative 'hand'
require_relative 'deck'

class Blackjack
  def initialize
    @deck = Deck.new
    @player_hand = []
    @dealer_hand = []
  end

  def run_game
    @player_hand = Hand.new(@deck.deal(2), "Player")
    player_turn(@player_hand)
    unless @player_hand.score > 21
      @dealer_hand = Hand.new(@deck.deal(2), "Dealer")
      dealer_turn(@dealer_hand)
      winner(@player_hand.score, @dealer_hand.score) unless @dealer_hand.score > 21
    end
  end

  def player_turn(hand)
    puts "Welcome to Blackjack!\n\n"
    output_hand(hand)
    hand.calculate_hand
    output_score(hand)
    player_hit_or_stand(hand)
  end

  def dealer_turn(hand)
    puts "\n\n"
    output_hand(hand)
    dealer_hit_or_stand(hand)
  end

  def player_hit_or_stand(hand)
    while true
      print "\nHit or stand (H/S): "
      answer = gets.chomp.downcase

      player_hit?(answer)
      break if bust?(hand) == 0
      break if player_stand?(answer) == 0
      invalid_input?(answer)
    end
  end

  def dealer_hit_or_stand(hand)
    while true
      hand.calculate_hand
      break if bust?(hand) == 0
      break if dealer_stand?(hand) == 0
      dealer_hit?(hand)
    end
  end


  def dealer_stand?(hand)
    if hand.score >= 17
      output_score(hand)
      puts "\nDealer stands"
      return 0
    end
  end

  def dealer_hit?(hand)
    if hand.score < 17
      hit(hand)
      output_dealt_card(hand)
    end
  end

  def invalid_input?(answer)
    if answer != "h" && answer != "s"
      puts "Input not recognized"
    end
  end


  def player_hit?(answer)
    if answer == "h"
      hit(@player_hand)
      puts
      output_dealt_card(@player_hand)
      @player_hand.calculate_hand
      output_score(@player_hand)
    end
  end

  def player_stand?(answer)
    if answer == "s"
      @player_hand.calculate_hand
      puts
      output_score(@player_hand)
      return 0
    end
  end

  def bust?(hand)
    if hand.score > 21
      if hand.name == "Player"
        puts "\nBust! You lose..."
        return 0
      else
        output_score(hand)
        puts "\nDealer busts! You win!"
        return 0
      end
    end
  end

  def hit(hand)
    hand.add_card(@deck.deal(1).first)
  end

  def output_hand(hand)
    hand.cards.each { |card| puts "#{hand.name} was dealt #{card.card}" }
  end

  def output_dealt_card(hand)
    puts "#{hand.name} was dealt #{hand.cards.last.card}"
  end

  def output_score(hand)
    puts "#{hand.name} score: #{hand.score}"
  end

  def winner(player_score, dealer_score)
    if player_score > dealer_score
      puts "\nYou win!"
    elsif dealer_score > player_score
      puts "\nDealer wins."
    else
      puts "\nIt's a tie."
    end
  end

end

Blackjack.new.run_game

# binding.pry
