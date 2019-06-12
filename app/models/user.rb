class User < ApplicationRecord
  enum gender: { unknown: 0, male: 1, female: 2, other: 9 }
  
  
  #ユーザー名による絞り込み 
scope :get_by_name, ->(name) {
where("name like ?", "%#{name}%")
}
#性別による絞り込み
scope :get_by_gender, ->(gender) {
where(gender: gender)
}
  
  
  has_many :attendances, dependent: :destroy
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :department, length: { in: 3..50 }, allow_blank: true
end