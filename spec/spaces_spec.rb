#spec/spaces_spec.rb
require "./lib/spaces.rb"

describe Spaces do
  describe "#get_space" do
    class DummyClass
    end

    before(:each) do
      @dummy_class = DummyClass.new
      @dummy_class.extend(Spaces)
    end

    it "will return an array when given a valid value" do
      expect(@dummy_class.get_space("a1").is_a?(Array)).to be true
    end

    it "will return a specific array when given a valid value" do
      expect(@dummy_class.get_space("h8")).to eql [7,7]
    end
  end
end