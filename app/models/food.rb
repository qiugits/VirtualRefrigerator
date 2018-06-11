class Food < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, :kind_id, presence: true
  before_save :update_nutri
  after_save :delete_lte_zero

  private
  def update_nutri
    if self.amount.nil?
      self.amount = 0
    end
    kind = FoodKind.find(self.kind_id)
    self.protein = kind.protein * self.amount
    self.lipd = kind.lipd * self.amount
    self.carbon = kind.carbon * self.amount
    self.vitamin = kind.vitamin * self.amount
    self.minerals = kind.minerals * self.amount
  end

  def delete_lte_zero
    if self.amount <= 0
      #self = Food.find(params[:id]).destroy
      self.destroy
    end
  end
end
