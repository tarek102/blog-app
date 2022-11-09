require 'rails_helper'

RSpec.describe 'Post index', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Tarek',
      bio: 'I am a full-stack developer',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      post_counter: 0
    )

    @post1 = Post.create(
      author: @user,
      title: 'My first post',
      text: 'This is my first post',
      comments_counter: 0,
      likes_counter: 0
    )

    @post2 = Post.create(
      author: @user,
      title: 'My second post',
      text: 'This is my second post',
      comments_counter: 0,
      likes_counter: 0
    )

    Comment.create(post_id: @post1.id, author_id: @user.id, text: 'Great job!')
    Comment.create(post_id: @post2.id, author_id: @user.id, text: 'Thanks for the effort')
    Like.create(post_id: @post1.id, author_id: @user.id)
    Like.create(post_id: @post2.id, author_id: @user.id)

    visit user_posts_path(@user)
  end

  it 'display the username' do
    expect(page).to have_content(@user.name)
  end

  it 'displays the post text' do
    expect(page).to have_content(@post2.text)
  end

  it 'display the post title' do
    expect(page).to have_content(@post1.title)
  end

  it 'displays the number of comments' do
    expect(page).to have_content('2')
  end

  it 'displays the number of posts' do
    expect(page).to have_content('Number of posts: 2')
  end

  it 'When I click on a post, it redirects me to that post show page' do
    click_link @post2.title
    expect(page).to have_current_path(user_post_path(@user.id, @post2))
  end
end
