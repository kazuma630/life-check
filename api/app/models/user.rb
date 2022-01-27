class User < ApplicationRecord
  validates :nickname, presence: true, length: { maximum: 24 }
  validates :birth_at, presence: true

end