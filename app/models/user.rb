class User < ActiveRecord::Base
  authenticates_with_sorcery!
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :name, uniqueness: true
  validates :email, uniqueness:   true,
                    email_format: { message: 'has invalid format' }
end
