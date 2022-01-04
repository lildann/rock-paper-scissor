class Game 
  attr_reader :inputs

  def initialize(player_input)
    @player_input = player_input
    @inputs = [player_input]
  end
  
  def store_opponent_input
    @inputs << opponent_input
    opponent_input
  end

  def opponent_input # encapsulate to enable stubbing while testing
    ["rock", "paper", "scissor"].sample
  end

  def result
    store_opponent_input
    p @inputs
    player, opponent = @inputs
    case
      when player == "rock" && opponent == "paper" then return :lost
      when player == "scissor" && opponent == "paper" then return :won
      when player == "scissor" && opponent == "rock" then return :lost
      when player == "paper" && opponent == "rock" then return :won
      when player == "paper"  && opponent == "scissor" then return :lost
      when player == "rock" && opponent == "scissor" then return :won
      else
        :drew
    end 
  end
end


