require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# Nominal Cases
# sums up hand
# raises an exception if sum > 21

# Edge Cases
# too many or too few cards
# card has value < 1 or > 11
# six cards and not bust
# know if aces are 1 or 11

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do

    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert
    score.must_equal 7

    # Re-arrange
    hand = [3, 4, 6, 4, 2]

    # Act
    score = blackjack_score(hand)

    # Assert
    score.must_equal 19

  end

  it 'facecards have values calculated correctly' do

      # Arrange
      hand = ["Queen", "Jack"]

      # Act
      score = blackjack_score(hand)

      # Assert
      score.must_equal 20

      # Re-arrange
      hand = ["King", 8, 1]

      # Act
      score = blackjack_score(hand)

      # Assert
      score.must_equal 19

  end

  it 'calculates aces as 11 where it does not go over 21' do

    # Arrange
    hand = [1, 2, 4, 1]

    # Act
    score = blackjack_score(hand)

    # Assert
    score.must_equal 18

  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do

    # Arrange
    hand = ["Queen", 5, 1]

    # Act
    score = blackjack_score(hand)

    # Assert
    score.must_equal 16


  end

  it 'raises an ArgumentError for invalid cards' do

    # Arrange
    hand = [0, 1, 6]

    # Act and Assert
    expect{
      blackjack_score(hand)
    }.must_raise ArgumentError

    # Arrange
    hand = [12, 4, 4]

    # Act and Assert
    expect{
      blackjack_score(hand)
    }.must_raise ArgumentError

  end

  it 'raises an ArgumentError for scores over 21' do

    # Arrange
    hand = ["Jack", 8, 8]

    # Act and Assert
    expect{
      blackjack_score(hand)
    }.must_raise ArgumentError

  end

  it 'raises an ArgumentError for hand too small or too large' do

    # Arrange
    hand = ["Jack"]

    # Act and Assert
    expect{
      blackjack_score(hand)
    }.must_raise ArgumentError

    # Arrange
    hand = [1, 2, 3, 4, 5, 6]

  end

end
