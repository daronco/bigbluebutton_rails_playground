# -*- coding: utf-8 -*-
require "spec_helper"

describe Site do
  let(:site) { FactoryGirl.create(:site) }

  it "creates a new instance given valid attributes" do
    FactoryGirl.build(:site).should be_valid
  end

  # to ensure that the migration is correct
  context "db" do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:description).of_type(:text) }
    it { should have_db_column(:signature).of_type(:text) }
    it { should have_db_column(:domain).of_type(:string) }
    it { should have_db_column(:locale).of_type(:string) }
    it { should have_db_column(:feedback_url).of_type(:string) }
    it { should have_db_column(:analytics_code).of_type(:string) }
    it { should have_db_column(:exception_notifications).of_type(:boolean) }
    it { should have_db_column(:exception_notifications_email).of_type(:string) }
    it { should have_db_column(:exception_notifications_prefix).of_type(:string) }
    it { should have_db_column(:shib_enabled).of_type(:boolean) }
    it { should have_db_column(:shib_name_field).of_type(:string) }
    it { should have_db_column(:shib_email_field).of_type(:string) }
    it { should have_db_column(:smtp_user_name).of_type(:string) }
    it { should have_db_column(:smtp_password).of_type(:string) }
    it { should have_db_column(:smtp_auto_tls).of_type(:boolean) }
    it { should have_db_column(:smtp_server).of_type(:string) }
    it { should have_db_column(:smtp_port).of_type(:integer) }
    it { should have_db_column(:smtp_domain).of_type(:string) }
    it { should have_db_column(:smtp_auth_type).of_type(:string) }
    it { should have_db_column(:smtp_sender).of_type(:string) }
    it "default values" do
      obj = Site.new
      obj.exception_notifications.should be_false
      obj.shib_enabled.should be_false
      obj.chat_enabled.should be_false
    end
  end

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:domain) }

  pending ".current"

  describe "#protocol" do
    subject { site.protocol }
    it { should eql("http") }
  end

  context "#domain_with_protocol" do
    before {
      site.should_receive(:protocol) { "any_protocol" }
      site.should_receive(:domain) { "any_domain" }
    }
    subject { site.domain_with_protocol }
    it { should eql("any_protocol://any_domain") }
  end

  context "#email_with_name" do
    before {
      site.should_receive(:name) { "any_name" }
      site.should_receive(:email) { "any_email" }
    }
    subject { site.email_with_name }
    it { should eql("any_name <any_email>") }
  end

end
