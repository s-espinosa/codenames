class User < ActiveRecord::Base
  belongs_to :game

  enum team: ["Blue", "Red"]
end
