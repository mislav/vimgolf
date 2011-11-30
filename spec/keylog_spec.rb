require "helper"

describe VimGolf::Keylog do
  Dir['spec/fixtures/*'].each do |f|
    it "should parse #{f} logfile" do
      lambda { described_class.convert(IO.read(f)) }.should_not raise_error
    end

    it "should score #{f} logfile" do
      lambda { described_class.score(IO.read(f)) }.should_not raise_error
    end
  end
end
