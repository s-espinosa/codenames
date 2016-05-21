require 'rails_helper'

describe Game do
  context "when initialized" do
    it "generates a game code" do
      game = Game.new
      game.generate_code
      code = game.code

      expect(code.length).to eq(4)
    end
  end
end
