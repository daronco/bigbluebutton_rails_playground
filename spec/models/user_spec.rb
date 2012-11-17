# -*- coding: utf-8 -*-
require "spec_helper"

describe User do

  it "creates a new instance given valid attributes" do
    FactoryGirl.build(:user).should be_valid
  end

  it { should validate_presence_of(:username) }
  it {
    FactoryGirl.create(:user)
    should validate_uniqueness_of(:username).case_insensitive
  }
  it { should ensure_length_of(:username).is_at_least(3) }
  it { should allow_mass_assignment_of(:username) }
  it { should validate_format_of(:username).with('_user') }
  it { should validate_format_of(:username).with("_abc") }
  it { should validate_format_of(:username).with("abc") }
  it { should validate_format_of(:username).with("123") }
  it { should validate_format_of(:username).with("abc-123_D5") }
  it { should validate_format_of(:username).not_with('user$') }
  it { should validate_format_of(:username).not_with('user@') }
  it { should validate_format_of(:username).not_with('user%') }
  it { should validate_format_of(:username).not_with("123 321") }
  it { should validate_format_of(:username).not_with("") }
  it { should validate_format_of(:username).not_with("ab@c") }
  it { should validate_format_of(:username).not_with("ab#c") }
  it { should validate_format_of(:username).not_with("ab$c") }
  it { should validate_format_of(:username).not_with("ab%c") }
  it { should validate_format_of(:username).not_with("ábcd") }
  it { should validate_format_of(:username).not_with("-abc") }
  it { should validate_format_of(:username).not_with("abc-") }

  it { should validate_presence_of(:email) }
  it { should allow_mass_assignment_of(:email) }
  it {
    FactoryGirl.create(:user)
    should validate_uniqueness_of(:email)
  }

  it { should have_attr_accessor(:login) }

  it { should validate_presence_of(:name) }
  it { should allow_mass_assignment_of(:name) }

  it { should allow_mass_assignment_of(:password) }

  it { should allow_mass_assignment_of(:password_confirmation) }

  it { should allow_mass_assignment_of(:remember_me) }

  context "devise" do
    # TODO: test the modules that were enabled?

    describe "#find_first_by_auth_conditions" do
      it "uses the attribute :login to login by username or email"
    end
  end

  describe "#anonymous" do
    subject { user.anonymous? }

    context "for a user in the database" do
      let(:user) { FactoryGirl.create(:user) }
      it { should be_false }
    end

    context "for a user not in the database" do
      let(:user) { FactoryGirl.build(:user) }
      it { should be_true }
    end
  end

end
