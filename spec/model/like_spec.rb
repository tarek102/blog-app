require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                     post_counter: 1)
  Post.create(author: user, title: 'Half of a yellow sun', text: 'This is my first post', comments_counter: 1,
              likes_counter: 2)

  like = Like.new
  before { like.save }

  it 'Raise error if there is no like' do
    expect { like.likes_counter }.to raise_error(NoMethodError)
  end
end
