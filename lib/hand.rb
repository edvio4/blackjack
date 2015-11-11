require_relative 'card'
require 'pry'

class Hand
  attr_reader :cards, :score, :name

  def initialize(cards, name)
    @name = name
    @score = 0
    @cards = []
    cards.each { |card| @cards << create_obj_for_card(card) }
  end

  def add_card(card)
    @cards << create_obj_for_card(card)
  end

  def calculate_hand
    score = 0
    aces = 0
    @cards.each { |card| card.type == "ace" ? aces+=1 : score+=card.value }
    aces.times { score <= 10 ? score+=11 : score+=1 }
    @score = score
  end

  def create_obj_for_card(card)
    Card.new(card)
  end

end
