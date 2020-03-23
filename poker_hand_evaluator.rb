# Evaluates poker hands for validity and determines the winning hand

require 'pry'
class PokerHandEvaluator
  def initialize(hands)
    @hands = hands.first
  end

  def hand_classifications
    return ["FOUR_OF_A_KIND"] if four_of_a_kind?
    return ["THREE_OF_A_KIND"] if three_of_a_kind?
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

  def three_of_a_kind?
    seperated_hand = @hands.split
    first_digit = seperated_hand.map do |card|
      card.chop 
    end
    result = first_digit.each_with_object(Hash.new(0)) { |card,counts| counts[card] += 1 }
    result.has_value?(3)
  end

  def four_of_a_kind?
    seperated_hand = @hands.split
    first_digit = seperated_hand.map do |card|
      card.chop 
    end
    result = first_digit.each_with_object(Hash.new(0)) { |card,counts| counts[card] += 1 }
    result.has_value?(4)
  end
end

