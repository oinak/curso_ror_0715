class Post < ActiveRecord::Base

  validates :title, presence: true, length: { minimum: 5 }

  # validates(:url, {:format => { :with => Regexp.new('https?//.*') }})
  validates :url, format: { with:  /https?:\/\/.*/ }

  validates :description, length: { minimum: 10,
                                    maximum: 255,
                                    message: 'debe tener entre 10 y 255 caracteres'}
end
