# Evaluates poker hands for validity and determines the winning hand

require 'pry'
class PokerHandEvaluator
  def initialize(hands)
    @hands = hands.first
  end

  def hand_classifications
    seperated_hand = @hands.split
    first_digit = seperated_hand.map do |card|
      card.chop 
    end
    if
      first_digit.uniq.length == 4
      return ["ONE_PAIR"]
    end
  end
end
