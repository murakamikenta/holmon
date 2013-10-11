class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  
  scope :default, -> { order("updated_at DESC") }  
    
  validates :title, presence: true, length: { maximum: 140 }
  validates :body, presence: true, length: { maximum: 500 }
  
end
