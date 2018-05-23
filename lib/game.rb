class Game

  attr_reader :started
  attr_reader :finished

  def start
    @started = true
  end

  def finish
    @finished = true
  end

  def started?
    started
  end

  def finished?
    finished
  end

  def exist?
    true
  end

  def play(left = nil, right = nil)
    raise 'Game must first be started' unless started?
    return nil unless (left && right)

    if ((left == :rock && right == :scissors) || (right == :rock && left == :scissors))
      finish
      "Rock beats scissors!"
    elsif ((left == :paper && right == :rock) || (right == :paper && left == :rock))
      finish
      "Paper beats rock!"
    elsif ((left == :paper && right == :scissors) || (right == :paper && left == :scissors))
      finish
      "Scissors beats paper!"
    else
      "Tie game. Try again!"
    end
  end
end