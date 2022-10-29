require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', post_counter: 1) }

  before { subject.save }

  it 'Name must be valid' do
    subject.name = 'Tom'
    expect(subject).to be_valid
  end

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'post_counter should be valid' do
    subject.post_counter = 1
    expect(subject).to be_valid
  end

  it 'post_counter should be integer' do
    subject.post_counter = 'one'
    expect(subject).to_not be_valid
  end
end
