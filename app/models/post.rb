class Post < ActiveRecord::Base

  # Asociaciones
  has_many :comments
  belongs_to :user, dependent: :destroy

  # Validaciones
  validates :title, presence: true, length: { minimum: 5 }

  # validates(:url, {:format => { :with => Regexp.new('https?//.*') }})
  validates :url, format: { with:  /https?:\/\/.*/ }

  validates :description, length: { minimum: 10,
                                    maximum: 255,
                                    message: 'debe tener entre 10 y 255 caracteres'}

  # scope :recent, lambda { |date = 1.week.ago|
  #   where('created_at > ?', date)
  # }
  scope :recent, lambda { |*args|
    # if args && args.first
    #   date = args.first
    # else
    #   date = 1.week.ago
    # end
    date = ( args && args.first ? args.first : 1.week.ago )
    where('created_at > ?', date)
  }

  scope :interesting, lambda { |want_all, quantity = 10|
    includes(:comments)
      .published(want_all)
      .limit(quantity)
      .order('updated_at DESC') # el último comentado 1º
      # .order('created_at ASC')
  }

  scope :published, lambda { |want_all|
    if want_all
      where({})
    else
      where(published: true)
    end
  }

  scope :visible_by, lambda { |user|
    includes(:user).where('user_id = ? OR published = ?', user, true)
  }

end
