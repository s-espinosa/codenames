class Game < ActiveRecord::Base
  validates :code, uniqueness: true
  has_many :users
  has_many :game_words
  has_many :words, through: :game_words

  def generate_code
    while true
      code = SecureRandom.hex(2)
      break if update(code: code)
    end
    code
  end

  def generate_words
    all_words = Word.all
    25.times do
      word = all_words.shuffle.pop
      GameWord.create(word: word, game: self)
    end
  end

  def user_count
    users.count
  end
end
