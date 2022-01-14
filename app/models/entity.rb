class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :description, length: { maximum: 100 }

  after_save :update_groups_total_amount
  after_save :update_users_total_expenses
  after_destroy :update_users_total_expenses
  after_destroy :update_groups_total_amount

  private

  def update_groups_total_amount
    group = self.group
    group.total_amount = group.entities.sum(:amount)
    group.save
  end

  def update_users_total_expenses
    current_user = self.user
    current_user.total_expenses = current_user.entities.sum(:amount)
    current_user.save
  end
end
