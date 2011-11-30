require "helper"

describe VimGolf::Keylog do
  Dir['spec/fixtures/*'].each do |f|
    it "should parse #{f} logfile" do
      lambda { described_class.parse(IO.read(f)) }.should_not raise_error
    end

    it "should score #{f} logfile" do
      lambda { described_class.score(IO.read(f)) }.should_not raise_error
    end
  end

  it "parses encoded logs" do
    input = ":ab<C-c>d3e<Esc>f"
    log = described_class.parse_encoded input
    log.to_a.should == %w[ : a b <C-c> d 3 e <Esc> f ]
  end
end
