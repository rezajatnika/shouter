require 'rails_helper'

describe User do
  subject(:user) { Fabricate.build(:user) }

  context 'with valid information' do
    it { expect(user).to be_valid }
  end

  context 'without a username' do
    it { expect(Fabricate.build(:user, username: nil)).to be_invalid }
  end

  context 'without an email' do
    it { expect(Fabricate.build(:user, email: nil)).to be_invalid }
  end

  context 'without a password' do
    it {expect(Fabricate.build(:user, password: nil)).to be_invalid }
  end

  context 'with invalid email adress' do
    it { expect(Fabricate.build(:user, email: 'foo.baz@.net')).to be_invalid }
  end

  context 'with invalid username format' do
    it { expect(Fabricate.build(:user, username: 'foo$%')).to be_invalid }
  end

  context 'when password is too short' do
    short_pass = Fabricate.build(:user, password: 'asd', password_confirmation: 'asd')
    it { expect(short_pass).to be_invalid }
  end

  describe 'length of username' do
    context 'when is too short' do
      it { expect(Fabricate.build(:user, username: 'fo')).to be_invalid }
      end

    context 'when is too long' do
      it { expect(Fabricate.build(:user, username: "#{ 'a' * 26 }")).to be_invalid }
    end
  end

  describe 'uniqueness' do
    before { Fabricate(:user) }

    context 'with duplicated email address' do
      it { expect(Fabricate.build(:user, username: 'bar')).to be_invalid }
    end

    context 'with duplicated username' do
      it { expect(Fabricate.build(:user, email: 'foo@bar.net')).to be_invalid }
    end
  end
end
