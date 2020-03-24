# Evaluates poker hands for validity and determines the winning hand

require 'pry'
class PokerHandEvaluator

  STRAIGHT_HAND = ['2345A','23456','34567','45678','56789','06789','0789J','089JQ','09JKQ','0AJKQ']
  ROYAL_FLUSH = ['0AJKQ']

  def initialize(hands)
    @hands = hands.first
  end

  def hand_classifications
    return ["ROYAL_FLUSH"] if royal_flush?
    return ["STRAIGHT_FLUSH"] if straight_flush?
    return ["FOUR_OF_A_KIND"] if four_of_a_kind?
    return ["FULL_HOUSE"] if full_house?
    return ["FLUSH"] if flush?
    return ["STRAIGHT"] if straight?
    return ["THREE_OF_A_KIND"] if three_of_a_kind?
    return ["TWO_PAIR"] if two_pair?
    return ["ONE_PAIR"] if one_pair?
    return ["HIGH_CARD"]
  end

  def one_pair?
    seperated_hand = @hands.split
    value = seperated_hand.map do |card|
      card.chop 
    end
    result = value.each_with_object(Hash.new(0)) { |card,counts| counts[card] += 1 }
    result.has_value?(2)
  end
 
  def two_pair?
    seperated_hand = @hands.split
    value = seperated_hand.map do |card|
      card.chop 
    end
    result = value.each_with_object(Hash.new(0)) { |card, counts| counts[card] += 1 }
    not_pairs = result.delete_if{|card, counts| counts == 2}
    not_pairs.length == 1
  end

  def three_of_a_kind?
    seperated_hand = @hands.split
    value = seperated_hand.map do |card|
      card.chop 
    end
    result = value.each_with_object(Hash.new(0)) { |card,counts| counts[card] += 1 }
    result.has_value?(3)
  end

  def four_of_a_kind?
    seperated_hand = @hands.split
    value = seperated_hand.map do |card|
      card.chop 
    end
    result = value.each_with_object(Hash.new(0)) { |card,counts| counts[card] += 1 }
    result.has_value?(4)
  end

  def straight?
    seperated_hand = @hands.split
    value = seperated_hand.map do |card|
      card.chop 
    end.sort.join
    
    STRAIGHT_HAND.include?(value)
  end

  def flush?
    seperated_hand = @hands.split
    suit = seperated_hand.map do |card|
      card.slice(1)
    end
    result = suit.each_with_object(Hash.new(0)) { |card,counts| counts[card] += 1 }
    result.has_value?(5)
  end

  def full_house?
    ( three_of_a_kind? && one_pair? )
  end

  def straight_flush?
    ( flush? && straight? )
  end

  def royal_flush?
    seperated_hand = @hands.split
    value = seperated_hand.map do |card|
      card.chop 
    end.sort.join
    
    ( ROYAL_FLUSH.include?(value) && flush? )
  end
end

