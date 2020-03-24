# Evaluates poker hands for validity and determines the winning hand

require 'pry'
class PokerHandEvaluator

  STRAIGHT_HAND = ['2345A','23456','34567','45678','56789','06789','0789J','089JQ','09JKQ','0AJKQ']
  ROYAL_FLUSH = ['0AJKQ']

  def initialize(hands)
    @hands = hands
  end

  def hand_classifications
    @hands.map do |hand|
      if royal_flush?(hand)
        "ROYAL_FLUSH"
      elsif straight_flush?(hand)
        "STRAIGHT_FLUSH"
      elsif four_of_a_kind?(hand)
        "FOUR_OF_A_KIND"
      elsif full_house?(hand)
        "FULL_HOUSE"
      elsif flush?(hand)
        "FLUSH"
      elsif straight?(hand)
        "STRAIGHT"
      elsif three_of_a_kind?(hand)
        "THREE_OF_A_KIND"
      elsif two_pair?(hand)
        "TWO_PAIR"
      elsif one_pair?(hand)
        "ONE_PAIR"
      else
        "HIGH_CARD"
      end
    end

  end

  def seperated_hand(hand)
    @seperated_hand = hand.split
  end

  def one_pair?(hand)
    seperated_hand(hand)
    value = @seperated_hand.map do |card|
      card.chop 
    end
    result = value.each_with_object(Hash.new(0)) { |card,counts| counts[card] += 1 }
    result.has_value?(2)
  end
 
  def two_pair?(hand)
    seperated_hand(hand)
    value = @seperated_hand.map do |card|
      card.chop 
    end
    result = value.each_with_object(Hash.new(0)) { |card, counts| counts[card] += 1 }
    not_pairs = result.delete_if{|card, counts| counts == 2}
    not_pairs.length == 1
  end

  def three_of_a_kind?(hand)
    seperated_hand(hand)
    value = @seperated_hand.map do |card|
      card.chop 
    end
    result = value.each_with_object(Hash.new(0)) { |card,counts| counts[card] += 1 }
    result.has_value?(3)
  end

  def four_of_a_kind?(hand)
    seperated_hand(hand)
    value = @seperated_hand.map do |card|
      card.chop 
    end
    result = value.each_with_object(Hash.new(0)) { |card,counts| counts[card] += 1 }
    result.has_value?(4)
  end

  def straight?(hand)
    seperated_hand(hand)
    value = @seperated_hand.map do |card|
      card.chop 
    end.sort.join
    
    STRAIGHT_HAND.include?(value)
  end

  def flush?(hand)
    seperated_hand(hand)
    suit = @seperated_hand.map do |card|
      card.slice(1)
    end
    result = suit.each_with_object(Hash.new(0)) { |card,counts| counts[card] += 1 }
    result.has_value?(5)
  end

  def full_house?(hand)
    ( three_of_a_kind?(hand) && one_pair?(hand) )
  end

  def straight_flush?(hand)
    ( flush?(hand) && straight?(hand) )
  end

  def royal_flush?(hand)
    seperated_hand(hand)
    value = @seperated_hand.map do |card|
      card.chop 
    end.sort.join
    
    ( ROYAL_FLUSH.include?(value) && flush?(hand) )
  end
end

