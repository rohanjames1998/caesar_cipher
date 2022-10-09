require './lib/caesar_cipher'

describe CaesarCipher do
  describe "#encrypt" do
    it "returns string's each letter shifted 5 places ahead" do
      expect(subject.encrypt("What a string!", 5)).to eql("Bmfy f xywnsl!")
    end
  end
end
