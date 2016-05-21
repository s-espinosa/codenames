class AddTeamAndRole
  def initialize(user, code)
    @user = user
    @code = code
    assign_game
    assign_team
    assign_role
  end

  def assign_game
    game = Game.find_by(code: @code)
    @user.update(game: game)
  end

  def assign_team
    team = @user.game.user_count % 2
    @user.update(team: team)
  end

  def assign_role
    if @user.game.user_count <= 2
      @user.update(role: 0)
    else
      @user.update(role: 1)
    end
  end
end
