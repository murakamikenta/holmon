class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  
  scope :created_order, -> { order("created_at DESC") }
  
  validates :body, presence: true, length: { maximum: 300 }
    
end
