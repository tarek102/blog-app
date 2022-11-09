require 'rails_helper'

RSpec.describe 'Post show', type: :feature do
  before(:each) do
    @user = User.create(name: 'Tarek', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Full-stack',
                        post_counter: 1)
    @post = Post.create(author: @user, title: 'Post_1 Title', text: 'First post description', comments_counter: 0,
                        likes_counter: 0)
    @comment = Comment.create(post: @post, author: @user, text: 'This is first comment!')
    visit user_post_path(@user.id, @post)
  end

  it 'can see a post title' do
    expect(page).to have_content(@post.title)
  end

  it 'can see how many comments a post has' do
    expect(page).to have_content(@post.comments_counter)
  end

  it 'can see how many likes a post has' do
    expect(page).to have_content(@post.likes_counter)
  end

  it 'can see the comment each commentor left' do
    expect(page).to have_content(@comment.text)
  end

  it 'can see the username of each commentor' do
    expect(page).to have_content(@comment.author.name)
  end

  it 'can see some of the post body' do
    expect(page).to have_content(@post.text)
  end
end
