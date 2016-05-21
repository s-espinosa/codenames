class Game < ActiveRecord::Base
  validates :code, uniqueness: true
  has_many :users

  def generate_code
    while true
      code = SecureRandom.hex(2)
      break if update(code: code)
    end
    code
  end

  def user_count
    users.count
  end
end
