class Group < ApplicationRecord
  has_many :entities, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :icon, presence: true
end
