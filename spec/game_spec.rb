require_relative '../lib/game'

describe 'A game of rock paper scissors' do
  let(:game) {Game.new}

  it 'exists' do
    expect(game).to exist
  end

  it 'can start' do
    game.start
  end

  it 'is not initially started' do
    expect(game).to_not be_started
  end

  it 'a started game knows that it has started' do
    game.start
    expect(game).to be_started
  end

  describe 'playing' do

    context 'without starting' do
      it 'can not be played if it has not started' do
        expect { game.play }.to raise_error(RuntimeError)
      end
    end

    context 'after starting' do
      it 'can be played if it has started' do
        game.start
        expect { game.play }.to_not raise_error
      end

      it 'returns nil when not provided with anything' do
        game.start
        expect(game.play).to be_nil
      end

      it 'returns nil when only provided one rock, paper or scissor' do
        game.start
        expect(game.play(:FAKE)).to be_nil
      end

      it 'does not return nil when two objects are provided' do
        game.start
        expect(game.play(:FAKE, :FAKE)).to_not be_nil
      end
    end

    context 'rock vs scissors' do
      it 'announces the correct winner' do
        game.start
        expect(game.play(:rock, :scissors)).to eq("Rock beats scissors!")
        expect(game.play(:scissors, :rock)).to eq("Rock beats scissors!")
      end
      it ('is finished') do
        game.finish
        expect(game.finished).to be_truthy
      end
    end

    context 'rock vs paper' do
      it ('returns "Paper beats rock!"') do
        game.start
        expect(game.play(:paper, :rock)).to eq("Paper beats rock!")
        expect(game.play(:rock, :paper)).to eq("Paper beats rock!")
      end
      it ('is finished') do
        game.finish
        expect(game.finished).to be_truthy
      end
    end

    context 'scissors vs paper' do
      it ('returns "Scissors vs paper!"') do
        game.start
        expect(game.play(:scissors, :paper)).to eq("Scissors beats paper!")
        expect(game.play(:paper, :scissors)).to eq("Scissors beats paper!")
      end
      it ('is finished') do
        game.finish
        expect(game.finished).to be_truthy
      end
    end

    context 'a tie game' do
      it ('returns "Tie game. Try again!"') do
        game.start
        expect(game.play(:scissors, :scissors)).to eq("Tie game. Try again!")
      end
      it ('is not finished') do
        expect(game.finished).to be_falsy
      end
    end

  end

end
