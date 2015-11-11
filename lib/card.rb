class Card
  attr_reader :type, :suit, :card, :value

  def initialize(card)
    array = []
    array = determine_type_and_value(card)

    @type = array[0]
    @value = array[1]
    @card = card
    @suit = determine_suit(card)
  end

  def determine_suit(card)
    if card.include? '♦'
      return "diamonds"
    elsif card.include? '♣'
      return "clubs"
    elsif card.include? '♠'
      return "spades"
    else
      return "hearts"
    end
  end

  def determine_type_and_value(card)
    if card.include? "A"
      return "ace", nil
    elsif card.to_i != 0
      return "nonface", card.to_i
    else
      return "face", 10
    end
  end
end
