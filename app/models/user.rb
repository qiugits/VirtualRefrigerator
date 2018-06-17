class User < ApplicationRecord
  has_many :foods, dependent: :destroy
  before_save { email.downcase! }
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 4, maximum: 255 }

  def nutri_stats
    # 栄養素/日分
    {
      protein:  foods.sum(:protein) / 60, 
      lipd:     foods.sum(:lipd) / 70, 
      carbon:   foods.sum(:carbon) / 400, 
      vitamin:  foods.sum(:vitamin) / 130, 
      minerals: foods.sum(:minerals) / 5600, 
    }
  end
end
