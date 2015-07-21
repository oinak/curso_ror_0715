class Comment < ActiveRecord::Base
  belongs_to :post, dependent: :destroy

  validates :body, presence: true, length: { minimum: 2 }
end
