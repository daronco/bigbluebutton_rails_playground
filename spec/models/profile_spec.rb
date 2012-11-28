require 'spec_helper'

describe Profile do
  it "creates a new instance given valid attributes" do
    FactoryGirl.build(:profile).should be_valid
  end

  context "db" do
    it { should have_db_column(:organization).of_type(:string) }
    it { should have_db_column(:address).of_type(:string) }
    it { should have_db_column(:phone).of_type(:string) }
    it { should have_db_column(:city).of_type(:string) }
    it { should have_db_column(:country).of_type(:string) }
    it { should have_db_column(:about).of_type(:text) }
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at).of_type(:datetime) }
  end

  it { should belong_to(:user) }

  it { should allow_mass_assignment_of(:organization) }

  it { should allow_mass_assignment_of(:address) }

  it { should allow_mass_assignment_of(:phone) }

  it { should allow_mass_assignment_of(:city) }

  it { should allow_mass_assignment_of(:country) }

  it { should allow_mass_assignment_of(:about) }
end
