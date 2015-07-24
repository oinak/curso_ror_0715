class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :posts
  has_many :comments

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :name, uniqueness: true
  validates :email, uniqueness:   true,
                    email_format: { message: 'has invalid format' }
  def visible_posts
    Post.visible_by(self)
  end
end
