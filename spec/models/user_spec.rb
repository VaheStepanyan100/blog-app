require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Koko') }

  before { subject.save }

  describe 'validation tests' do
    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'posts_counter should be integer' do
      subject.posts_counter = 'hi'
      expect(subject).to_not be_valid
    end

    it 'posts_counter should be greater than or equal to zero' do
      subject.posts_counter = -2
      expect(subject).to_not be_valid
      subject.posts_counter = 0
      expect(subject).to be_valid
    end
  end
end
