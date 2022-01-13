class Group < ApplicationRecord
  has_many :entities, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :icon, presence: true

  def most_recent_group
    self.entities.maximum(:created_at)
  end
end
