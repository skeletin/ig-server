require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe "Attributes:"  do
    context 'when profile' do
      context 'has valid attributes' do
        subject { FactoryBot.build(:profile) }
        it { is_expected.to be_valid }
      end

      context 'has no first name' do
        subject { FactoryBot.build(:profile, first_name: nil) }
        it { is_expected.to be_invalid }
      end

      context 'has no last name' do
        subject { FactoryBot.build(:profile, last_name: nil) }
        it { is_expected.to be_invalid }
      end

      context 'has no city' do
        subject { FactoryBot.build(:profile, city: nil) }
        it { is_expected.to be_invalid }
      end

      context 'has no state' do
        subject { FactoryBot.build(:profile, state: nil) }
        it { is_expected.to be_invalid }
      end

      context 'has no zip code' do
        subject { FactoryBot.build(:profile, zip_code: nil) }
        it { is_expected.to be_invalid }
      end

      context 'has no phone number' do
        subject { FactoryBot.build(:profile, phone_number: nil) }
        it { is_expected.to be_invalid }
      end

      context 'has no street address' do
        subject { FactoryBot.build(:profile, street_address: nil) }
        it { is_expected.to be_invalid }
      end

      context 'has no birth date' do
        subject { FactoryBot.build(:profile, birth_date: nil) }
        it { is_expected.to be_invalid }
      end
    end
  end

  describe "Associations" do
    it "2belongs to a user" do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
  end
end
