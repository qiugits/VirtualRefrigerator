class Food < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  before_save :update_nutri

  private
  def update_nutri
    if self.amount <= 0
      #self = Food.find(params[:id]).destroy
      self.destroy
    else
      kind = FoodKind.find(self.kind_id)
      self.protein = kind.protein * self.amount
      self.lipd = kind.lipd * self.amount
      self.carbon = kind.carbon * self.amount
      self.vitamin = kind.vitamin * self.amount
      self.minerals = kind.minerals * self.amount
    end
  end
end
