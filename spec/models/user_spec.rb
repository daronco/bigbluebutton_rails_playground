# -*- coding: utf-8 -*-
require "spec_helper"

describe User do

  it "creates a new instance given valid attributes" do
    FactoryGirl.build(:user).should be_valid
  end

  context "db" do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:username).of_type(:string) }
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:locale).of_type(:string) }
    it { should have_db_column(:superuser).of_type(:boolean) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at).of_type(:datetime) }
    it { should have_db_column(:encrypted_password).of_type(:string) }
    it { should have_db_column(:reset_password_token).of_type(:string) }
    it { should have_db_column(:reset_password_sent_at).of_type(:datetime) }
    it { should have_db_column(:remember_created_at).of_type(:datetime) }
    it { should have_db_column(:sign_in_count).of_type(:integer) }
    it { should have_db_column(:current_sign_in_at).of_type(:datetime) }
    it { should have_db_column(:last_sign_in_at).of_type(:datetime) }
    it { should have_db_column(:confirmation_token).of_type(:string) }
    it { should have_db_column(:confirmed_at).of_type(:datetime) }
    it { should have_db_column(:confirmation_sent_at).of_type(:datetime) }
    it { should have_db_column(:unconfirmed_email).of_type(:string) }
    it { should have_db_index(:username).unique(true) }
    it { should have_db_index(:email).unique(true) }
    it { should have_db_index(:reset_password_token).unique(true) }
    it "default values" do
      obj = User.new
      obj.superuser.should be_false
      obj.email.should eql("")
      obj.sign_in_count.should be(0)
    end
  end

  it { should validate_presence_of(:username) }
  it {
    FactoryGirl.create(:user)
    should validate_uniqueness_of(:username).case_insensitive
  }
  it { should ensure_length_of(:username).is_at_least(3) }
  it { should allow_mass_assignment_of(:username) }
  # TODO: replace validate_format_of by allow_value
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

  it { should allow_mass_assignment_of(:superuser) }

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

  describe "abilities:" do
    subject { ability }
    let(:ability) { Abilities.ability_for(user) }
    let(:target) { FactoryGirl.create(:user) }

    context "a superuser" do
      let(:user) { FactoryGirl.create(:superuser) }
      it { should be_able_to(:manage, target) }
    end

    context "the user himself" do
      let(:user) { target }
      it {
        allowed = [:read, :update, :destroy]
        should_not be_able_to_do_anything_to(target).except(allowed)
      }
    end

    context "a normal user (but not the target user)" do
      let(:user) { FactoryGirl.create(:user) }
      it { should_not be_able_to_do_anything_to(target).except([:read]) }
    end

    context "an anonymous user" do
      let(:user) { User.new }
      it { should_not be_able_to_do_anything_to(target) }
    end
  end

end
