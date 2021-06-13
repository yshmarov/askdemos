class Account < ApplicationRecord
  validates :name, :subdomain, presence: true
  validates :subdomain, uniqueness: true

  has_many :posts, dependent: :destroy
end
