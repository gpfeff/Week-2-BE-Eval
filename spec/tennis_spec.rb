require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../tennis'

describe Tennis::Game do
  let(:game) { Tennis::Game.new }

  describe '.initialize' do
    it 'creates two players' do
      expect(game.player1).to be_a(Tennis::Player)
      expect(game.player2).to be_a(Tennis::Player)
    end

    it 'sets the opponent for each player' do
      expect(game.player1.opponent).to be(game.player2)
      expect(game.player2.opponent).to be(game.player1)
  end
  end

  describe '#wins_ball' do
    it 'increments the points of the winning player' do
      game.wins_ball(game.player1)
      

      expect(game.player1.points).to eq(1)
    end
  end
end

describe Tennis::Player do
  let(:player) do
    player = Tennis::Player.new
    player.opponent = Tennis::Player.new

    return player
  end

  describe '.initialize' do
    it 'sets the points to 0' do
      expect(player.points).to eq(0)
    end 
  end

  describe '#record_won_ball!' do
    it 'increments the points' do
      player.record_won_ball!

      expect(player.points).to eq(1)
    end
  end

  describe '#score' do
    context 'when points is 0' do
      it 'returns love' do
        expect(player.score).to eq('love')
      end
    end
    
    context 'when points is 1' do
      it 'returns fifteen' do
        player.points = 1

        expect(player.score).to eq('fifteen')
      end 
    end
    
    context 'when points is 2' do
      it 'returns thirty' do
          player.points = 2

      expect(player.score).to eq('thirty')
    end
  end
    
    context 'when points is 3' do
      it 'returns forty' do
        player.points = 3 

      expect(player.score).to eq('forty')
    end
  end

    context 'when both player points is 3 or more' do
      it 'returns deuce' do
        player.points = 4
        player.opponent.points = 4

      expect(player.score).to eq('deuce')
    end
  end

    context 'when both players score at least 3, and a player has one more point than his opponent' do
      it 'returns advantage' do
        player.points = 5
        player.opponent.points = 4

      expect(player.score).to eq('advantage')
    end
  end

  context 'Player wins the game after reaching deuce' do
      it 'returns winner!' do
        player.points = 6
        player.opponent.points = 4

      expect(player.score).to eq('winner!')
    end
  end

    context 'Player wins the game, no deuce is reached' do
      it 'returns winner!' do
        player.points = 4
        player.opponent.points = 2

      expect(player.score).to eq('winner!')
    end
  end

  # context 'Player wins a set' do
  #     it 'returns sets won' do
  #       player.score = 4
  #       player.opponent.points = 1

  #     expect(player.sets_won).to eq(1)
  #   end
  # end


end
end
