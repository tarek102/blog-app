require 'rails_helper'

RSpec.describe Post, type: :model do
  user_one = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                         post_counter: 1)
  post = Post.new(author: user_one, title: 'Half of a yellow sun', text: 'This is my first post', comments_counter: 1,
                  likes_counter: 2)

  before { post.save }

  it 'Title must be present' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'Title must be valid' do
    post.title = 'Half of a yellow sun'
    expect(post).to be_valid
  end

  it 'title should not be too long' do
    post.title = 'a' * 260
    expect(post).to_not be_valid
  end

  it 'Comments counter test' do
    post.comments_counter = 2
    expect(post).to_not be_valid
  end

  it 'Likes counter test' do
    post.likes_counter = 5
    expect(post).to_not be_valid
  end
end
