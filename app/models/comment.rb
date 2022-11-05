class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, foreign_key: 'post_id', class_name: 'Post'
  after_save :increase_comment_counter

  def increase_comment_counter
    post.increment!(:comments_counter)
  end
end
