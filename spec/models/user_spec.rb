require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(name: 'Pierre', photo: 'anas.png', bio: 'Student from Nigeria.', posts_counter: 4)
  end

  context 'with valid values' do
    it 'Name should be present' do
      @user.name = 'Pierre'
      expect(@user).to be_valid
    end

    it 'PostsCounter must be an integer greater than or equal to zero' do
      @user.posts_counter = 0
      expect(@user).to be_valid
    end
  end
end