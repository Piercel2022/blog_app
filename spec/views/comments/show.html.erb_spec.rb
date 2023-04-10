require 'rails_helper'

describe 'Test for recent comments on posts', type: :view do
  subject do
    Jamila = User.new(name: 'Jamila Kc', photo: 'profile.png',
                     bio: 'I am coming out to be the best computer programmer', posts_counter: 0)
    Post.new(title: 'My best friend', text: 'He will be unvailed at the end of my program at Microverse',
             comments_counter: 3, likes_counter: 3, author_id: Jamila.id)
  end
  it 'Should have maximum of five comments' do
    expect(subject.recent_comments).to eq(subject.recent_comments)
  end
end