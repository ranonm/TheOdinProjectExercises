require './lib/caesar_cipher.rb'

describe '#caesar_cipher' do
  it "returns right shifted characters when shift factor is a +tive integer" do
    expect(caesar_cipher("code", 2)).to eql("eqfg")
  end

  it "returns left shifted characters when shift factor is a -tive integer" do
    expect(caesar_cipher("code", -2)).to eql("ambc")
  end

  it "returns the unchanged string when supplied zero" do
    expect(caesar_cipher("code", 0)).to eql("code")
  end

  it "returns encrypted string with preserved spaces" do
    expect(caesar_cipher("write code", 3)).to eql("zulwh frgh")
  end

  it "returns encrypted string with preserved special characters" do
    expect(caesar_cipher("code!#@$", 3)).to eql("frgh!#@$")
  end

  it "returns encrypted string with preserved character case" do
    expect(caesar_cipher("Code", 2)).to eql("Eqfg")
  end

  it "wraps from z to a when right shifting" do
    expect(caesar_cipher("zoo", 5)).to eql("ett")
  end

  it "wraps from a to z when left shifting" do
    expect(caesar_cipher("abacus", -5)).to eql("vwvxpn")
  end
end