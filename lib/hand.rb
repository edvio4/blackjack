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
    updated_score = 0
    aces = 0
    @cards.each { |card| card.type == "ace" ? aces+=1 : updated_score+=card.value }
    aces.times { updated_score <= 10 ? updated_score+=11 : updated_score+=1 }
    @score = updated_score
  end

  def create_obj_for_card(card)
    Card.new(card)
  end

end
