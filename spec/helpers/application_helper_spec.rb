require 'spec_helper'

describe ApplicationHelper do

  describe "#gravatar_for" do

    it "default behavior" do
      email = 'email@example.com'
      url = 'http://www.gravatar.com/avatar/' + Digest::MD5::hexdigest(email.strip.downcase) + '.jpg?s=80'
      expected = '<img alt="avatar" class="avatar" src="' + url + '" />'
      gravatar_for(email).should eq(expected)
    end

    describe "accepts a hash with options" do
      let(:gravatar) {
        gravatar_for("email@example.com", { :alt => 'alt-1', :class => 'class-1', :size => '160', :style => 'any-1' })
      }
      it { gravatar.should match(/alt="alt-1"/) }
      it { gravatar.should match(/class="class-1"/) }
      it { gravatar.should match(/src="[^"]*jpg\?s=160"/) }
      it { gravatar.should match(/style="any-1"/) }
    end

  end

end



