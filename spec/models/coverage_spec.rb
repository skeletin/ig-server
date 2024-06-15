require 'rails_helper'

RSpec.describe Coverage, type: :model do
  describe "Attributes:" do
    context "when coverage has valid attributes" do
      subject { FactoryBot.build(:coverage) }
      it { is_expected.to be_valid }
    end

      context "when coverage name is absent" do
        subject { FactoryBot.build(:coverage, name: nil) }
        it { is_expected.to be_invalid }
      end

      context "when coverage name is not unique it" do
        before do
          FactoryBot.create(:coverage, name: "Test Coverage")
        end

        subject { FactoryBot.build(:coverage, name: "Test Coverage") }
        it { is_expected.to be_invalid }
      end

      context "when coverage details is absent" do
        subject { FactoryBot.build(:coverage, details: nil) }
        it { is_expected.to be_invalid }
      end

      context "when coverage details is absent" do
        subject { FactoryBot.build(:coverage, details: nil) }
        it { is_expected.to be_invalid }
      end
  end
end
