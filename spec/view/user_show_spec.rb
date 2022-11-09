require 'rails_helper'
RSpec.describe 'User show', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Tarek',
      bio: 'I am full-stack developer',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      post_counter: 0
    )
    @post1 = Post.create(
      author: @user,
      title: 'Post1 Title',
      text: 'This is my first post description',
      comments_counter: 0,
      likes_counter: 0
    )
    @post2 = Post.create(
      author: @user,
      title: 'Post2 Title',
      text: 'This is my second post description',
      comments_counter: 0,
      likes_counter: 0
    )
    @post3 = Post.create(
      author: @user,
      title: 'Post3 Title',
      text: 'This is my third post description',
      comments_counter: 0,
      likes_counter: 0
    )
    visit user_path(@user)
  end
  it 'display the correct username' do
    visit user_path(@user)
    expect(page).to have_content('Tarek')
  end
  it 'display the user photo' do
    expect(page.html).to include(@user.photo)
  end
  it 'display number of posts' do
    expect(page).to have_content("Number of posts: #{@user.post_counter}")
  end
  it 'display the number of comments' do
    expect(page).to have_content('Comments: 0')
  end
  it 'displays the correct number of likes' do
    expect(page).to have_content('Likes: 0')
  end
  it 'When I click a user post, it redirects me to that posts show page' do
    click_link @post1.title
    expect(page).to have_current_path(user_post_path(@user.id, @post1))
  end
  it 'Redirects to the user post index page' do
    click_link 'See all posts'
    expect(page).to have_current_path(user_posts_path(@user))
  end
end
