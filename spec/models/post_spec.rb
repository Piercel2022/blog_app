require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                        posts_counter: 1)
  end

  context 'Validations' do
    it 'checks for title presence' do
      test_title = 'This is my first post'
      post = Post.new(author: @user, title: test_title, text: 'This is my first post', likes_counter: 0,
                      comments_counter: 0)
      expect(post.valid?).to eq true
    end

    it 'checks for title length' do
      test_title = 0
      post = Post.new(author: @user, title: test_title, text: 'This is my first post', likes_counter: 0,
                      comments_counter: 0)
      expect(post.valid?).to eq true
    end

    it 'checks if likes_counter is an integer' do
      post = Post.new(author: @user, title: 'Post communication', text: 'This is my first post', likes_counter: 1,
                      comments_counter: 0)
      expect(post.valid?).to eq true
    end

    it 'checks if comments_counter is an integer' do
      post = Post.new(author: @user, title: 'Post communication', text: 'This is my first post', likes_counter: 0,
                      comments_counter: 'a')
      expect(post.valid?).to eq false
    end

    it 'checks if likes_counter is greater or equal to zero' do
      post = Post.new(author: @user, title: 'Post communication', text: 'This is my first post', likes_counter: 34,
                      comments_counter: 0)
      expect(post.valid?).to eq true
    end

    it 'checks if comments_counter is greater or equal to zero' do
      post = Post.new(author: @user, title: 'Post communication', text: 'This is my first post', likes_counter: 0,
                      comments_counter: 23)
      expect(post.valid?).to eq true
    end
  end

  context 'Associations' do
    it 'belongs to an author' do
      post = Post.reflect_on_association('author')
      expect(post.macro).to eq(:belongs_to)
    end

    it 'has many comments' do
      post = Post.reflect_on_association('comments')
      expect(post.macro).to eq(:has_many)
    end

    it 'has many likes' do
      post = Post.reflect_on_association('likes')
      expect(post.macro).to eq(:has_many)
    end
  end

  context 'Custom methods' do
    it 'updates posts_counter of the author' do
      Post.create(author: @user, title: 'Post communication', text: 'This is my first post', likes_counter: 0,
                  comments_counter: 2)
      expect(@user.posts_counter).to eq 2
    end
  end
end
