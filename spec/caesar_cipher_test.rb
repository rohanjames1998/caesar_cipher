require '../lib/caesar_cipher'

describe CaesarCipher do
  describe "#encrypt" do
    it "returns string's each letter shifted 5 places ahead" do
      expect(subject.encrypt("What a string!", 5)).to eql("Bmfy f xywnsl!")
    end

    it "returns string's each letter shifted 13 places ahead" do
      expect(subject.encrypt("Hello, world!")).to eql("Uryyb, jbeyq!")
    end

    it "returns string's each letter shifted 9 places ahead" do
      expect(subject.encrypt("CyPhEr Me 0w0")).to eql("LhYqNa Vn 0f0")
    end
  end

end
