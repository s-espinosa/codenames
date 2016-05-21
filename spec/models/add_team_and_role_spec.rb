require 'rails_helper'

describe AddTeamAndRole do
  context "when initialized" do
    it "assigns a team and role to a user" do
      game = Game.new
      code = game.generate_code
      user = User.new(name: "Jon")
      AddTeamAndRole.new(user, code)

      expect(user.role).to eq(0)
      expect(user.team).to eq("Red")
    end

    it "assigns alternating roles to users" do
      game = Game.new
      code = game.generate_code
      user1 = User.new(name: "Jon")
      AddTeamAndRole.new(user1, code)
      user2 = User.new(name: "Jim")
      AddTeamAndRole.new(user2, code)

      expect(user2.role).to eq(0)
      expect(user2.team).to eq("Blue")
    end

    it "begins making guessers" do
      game = Game.new
      code = game.generate_code
      user1 = User.new(name: "Jon")
      AddTeamAndRole.new(user1, code)
      user2 = User.new(name: "Jim")
      AddTeamAndRole.new(user2, code)
      user3 = User.new(name: "Jeff")
      AddTeamAndRole.new(user3, code)

      expect(user3.role).to eq(1)
      expect(user3.team).to eq("Red")
    end
  end
end
