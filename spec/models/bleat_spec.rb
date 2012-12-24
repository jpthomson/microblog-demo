require 'spec_helper'

describe Bleat do
  context "validations" do
    it "is invalid without any content" do
      bleat = build(:bleat, content: "")
      expect(bleat).not_to be_valid
    end
  end
end
