# blackjack_score.rb

VALID_CARDS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'King', 'Queen', 'Jack']

def blackjack_score(hand)
  hand.length.times do |i|
    if hand[i] == "King" || hand[i] == "Queen" || hand[i] == "Jack"
      hand[i] = 10
    elsif hand[i] == 1 && (hand.sum + 10) <= 21
      hand[i] = 11
    elsif hand[i] < 1 || hand[i] > 11
      raise ArgumentError, "Cards must have a value between 1 and 11."
    end
  end

  if hand.length < 2 || hand.length > 5
    raise ArgumentError, "Hand should have between 2-5 cards."
  elsif hand.sum > 21
    raise ArgumentError, "BUST!"
  end

  return hand.sum
end
