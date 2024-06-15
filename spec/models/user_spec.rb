require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Attributes:" do
    context 'when user has valid attributes' do
      subject { FactoryBot.build(:user) }
      it { is_expected.to be_valid  }
    end

    context 'when user has no password' do
      subject { FactoryBot.build(:user, password_digest: nil) }
      it { is_expected.to be_invalid }
    end

    context 'when user has no email' do
      subject { FactoryBot.build(:user, email: nil) }
      it { is_expected.to be_invalid }
    end

    context 'when user has invalid email format' do
      subject { FactoryBot.build(:user, email: "testgmail.com") }
      it { is_expected.to be_invalid }
    end
  end
end
