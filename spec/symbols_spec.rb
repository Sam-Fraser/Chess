#spec/symbols_spec.rb
require "./lib/symbols.rb"

describe Symbols do
  describe "#get_symbol" do
    class DummyClass
    end

    before(:each) do
      @dummy_class = DummyClass.new
      @dummy_class.extend(Symbols)
    end

    it "will return the piece asked for" do
      expect(@dummy_class.get_symbol("w_king")).to eql "\u{265A}"
    end
  end
end