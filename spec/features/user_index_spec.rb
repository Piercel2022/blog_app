require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Users Index', type: :request do
  subject { page }

  before(:each) do
    User.create(name: 'Tom', posts_counter: 5, id: 352, photo: 'image.jpg')
    User.create(name: 'Lilly', posts_counter: 2, id: 353, photo: 'image.jpg')
  end
  it 'assigns all users to @users' do
    get users_path
    expect(assigns(:users)).to eq(User.all)
  end
  it 'renders the name of the users' do
    get users_path
    expect(response.body).to include('Tom', 'Lilly')
  end
  it 'shows number of posts of user' do
    get users_path
    expect(response.body).to include('Number of Posts : 1')
  end
  it 'renders the profile picture of the users' do
    get users_path
    expect(response.body).to include('img')
  end
end
