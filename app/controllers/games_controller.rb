class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.new
    @game.generate_code
    redirect_to game_path(@game.id)
  end

  def show
    @game = Game.find(params[:id])
  end
end
