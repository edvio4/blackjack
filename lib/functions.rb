require_relative 'deck'
require_relative 'hand'


def player_turn(player_hand)
  puts "Welcome to Blackjack!\n\n"
  player_hand.cards.each { |card| puts "Player was dealt #{card.original}" }
  puts "Player score: #{player_hand.calculate_hand}"

  while true
    print "\nHit or stand (H/S):"
    answer = gets.chomp

    if answer.downcase == "h"
      player_hand.add_card(DECK.deal(1).first)
      player_hand.calculate_hand
      puts "\nPlayer was dealt #{player_hand.cards.last.original}"
      puts "Player score: #{player_hand.score}"
      if player_hand.score > 21
        puts "\nBust! You lose..."
        break
      end
    elsif answer.downcase == "s"
      player_hand.calculate_hand
      puts "\nPlayer score: #{player_hand.score}"
      break
    else
      puts "Input not recognized"
    end
  end
end

def dealer_turn(dealer_hand)
  puts "\n\n"
  dealer_hand.cards.each { |card| puts "Dealer was dealt #{card.original}" }

  while true
    dealer_hand.calculate_hand
    if dealer_hand.score > 21
      puts "Dealer score: #{dealer_hand.score}\n\n"
      puts "Dealer busts! You win!"
      break
    elsif dealer_hand.score >= 17
      puts "Dealer score: #{dealer_hand.score}\n\n"
      puts "Dealer stands"
      break
    else
      dealer_hand.add_card(DECK.deal(1).first)
      puts "Dealer was dealt #{dealer_hand.cards.last.original}"
    end
  end
end


def winner(player_score, dealer_score)
  if player_score > dealer_score
    puts "\nYou win!"
  else
    puts "\nDealer wins."
  end
end
