# Evaluates poker hands for validity and determines the winning hand

require 'pry'
class PokerHandEvaluator
  def initialize(hands)
    @hands = hands.first
  end

  def hand_classifications
    return ["TWO_PAIR"] if two_pair?
    return ["ONE_PAIR"] if one_pair?
  end

  def one_pair?
    seperated_hand = @hands.split
    first_digit = seperated_hand.map do |card|
      card.chop 
    end
    first_digit.uniq.length == 4
  end

  def two_pair?
    seperated_hand = @hands.split
    first_digit = seperated_hand.map do |card|
      card.chop 
    end
    first_digit.uniq.length == 3
  end

end
