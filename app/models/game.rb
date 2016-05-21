class Game < ActiveRecord::Base
  validates :code, uniqueness: true

  def generate_code
    while true
      code = SecureRandom.hex(2)
      break if update(code: code)
    end
  end
end
