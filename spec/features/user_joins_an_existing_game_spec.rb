require 'rails_helper'

RSpec.feature "Joining an existing game" do
  scenario "sees a screen with their team when they join a game" do
    game = Game.new
    game.generate_code

    visit '/'
    within("#join") do
      fill_in "user[name]", with: "Joiner Name"
      fill_in "user[game]", with: game.code
    end
    click_on "Join Game"
    team = find(".display").native.inner_html

    save_and_open_page
    expect(team).to eq("Red")
  end

  scenario "second player is assigned to the blue team" do
    game = Game.new
    game.generate_code
    player1 = game.users.create(name: "Player 1")

    visit '/'
    within("#join") do
      fill_in "user[name]", with: "Joiner Name"
      fill_in "user[game]", with: game.code
    end
    click_on "Join Game"
    team = find(".display").native.inner_html

    expect(team).to eq("Blue")
  end
end
