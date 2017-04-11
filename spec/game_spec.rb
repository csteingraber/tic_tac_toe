require "game"

describe Game do
  describe "#victory_check?" do
    let(:game_board) { game_board = double("game_board") }
    let(:game) { Game.new }

    context "when there are three X's in the top row" do
      it "should return true" do
        allow(game_board).to receive(:board).and_return([["X", "X", "X"], ["_", "_", "_"], ["_", "_", "_"]])
        allow(GameBoard).to receive(:new).and_return(game_board)
        expect(game.victory_check?).to eq(true)      
      end
    end

    context "when there are three X's in the middle row" do
      it "should return true" do
        allow(game_board).to receive(:board).and_return([["_", "_", "_"], ["X", "X", "X"], ["_", "_", "_"]])
        allow(GameBoard).to receive(:new).and_return(game_board)
        expect(game.victory_check?).to eq(true)      
      end
    end

    context "when there are three X's in the bottom row" do
      it "should return true" do
        allow(game_board).to receive(:board).and_return([["_", "_", "_"], ["_", "_", "_"], ["X", "X", "X"]])
        allow(GameBoard).to receive(:new).and_return(game_board)
        expect(game.victory_check?).to eq(true)      
      end
    end

    context "when there are three X's in the left column" do
      it "should return true" do
        allow(game_board).to receive(:board).and_return([["X", "_", "_"], ["X", "_", "_"], ["X", "_", "_"]])
        allow(GameBoard).to receive(:new).and_return(game_board)
        expect(game.victory_check?).to eq(true)      
      end
    end

    context "when there are three X's in the middle column" do
      it "should return true" do
        allow(game_board).to receive(:board).and_return([["_", "X", "_"], ["_", "X", "_"], ["_", "X", "_"]])
        allow(GameBoard).to receive(:new).and_return(game_board)
        expect(game.victory_check?).to eq(true)      
      end
    end

    context "when there are three X's in the right column" do
      it "should return true" do
        allow(game_board).to receive(:board).and_return([["_", "_", "X"], ["_", "_", "X"], ["_", "_", "X"]])
        allow(GameBoard).to receive(:new).and_return(game_board)
        expect(game.victory_check?).to eq(true)      
      end
    end

    context "when there are three X's in the top left diagonal" do
      it "should return true" do
        allow(game_board).to receive(:board).and_return([["X", "_", "_"], ["_", "X", "_"], ["_", "_", "X"]])
        allow(GameBoard).to receive(:new).and_return(game_board)
        expect(game.victory_check?).to eq(true)      
      end
    end

    context "when there are three X's in the top right diagonal" do
      it "should return true" do
        allow(game_board).to receive(:board).and_return([["_", "_", "X"], ["_", "X", "_"], ["X", "_", "_"]])
        allow(GameBoard).to receive(:new).and_return(game_board)
        expect(game.victory_check?).to eq(true)      
      end
    end    
  end
end