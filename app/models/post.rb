class Post < ApplicationRecord
  validates :title, presence: true, length: { in: 1..250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  after_save :update_posts_counter
  after_destroy :decrease_posts_counter
  after_initialize :init

  def return_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def decrease_posts_counter
    author.decrement!(:post_counter)
  end

  def init
    self.comments_counter ||= 0
    self.likes_counter ||= 0
  end

  private

  def update_posts_counter
    author.increment!(:post_counter)
  end
end
