class Comment < ActiveRecord::Base

  # Asociaciones
  belongs_to :post, dependent: :destroy
  belongs_to :user, dependent: :destroy

  # Validaciones
  validates :body, presence: true, length: { minimum: 2 }

  # Callbacks
  # marcar el post como 'actualizado' al comentarlo
  after_save :update_post
  # after_save -> { post.touch }

  private

  def update_post
    # post.updated_at = Time.now
    # post.save
    #
    # post.update_attribute(:updated_at, Time.now)
    post.touch
  end
end
