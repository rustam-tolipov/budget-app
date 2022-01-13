class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than: 0 }

  after_save :update_groups_total_amount
  after_save :update_users_total_expenses

  def last_created_at_amount
    self.group.entities.maximum(:created_at)
  end

  private

  def update_groups_total_amount
    group = self.group
    group.total_amount = group.entities.sum(:amount)
    group.save
  end

  def update_users_total_expenses
    user = self.user
    user.total_expenses = user.entities.sum(:amount)
    user.save
  end
end
