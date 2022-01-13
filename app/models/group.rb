class Group < ApplicationRecord
  has_many :entities, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :icon, presence: true

  def last_updated_at_amount
    self.group.entities.maximum(:updated_at)
  end
end
