# frozen_string_literal: true

RSpec.describe JapanPostcoder do
  it "has a version number" do
    expect(JapanPostcoder::VERSION).not_to be nil
  end

  describe "::to_address" do
    context "when postal code is valid" do
      it "returns the address in string format" do
        expect(JapanPostcoder.to_address("2140037")).to eq("神奈川県川崎市多摩区西生田")
      end
    end

    context "when postal code is invalid" do
      it "raises JapanPostcoder::InvalidPostalCodeError" do
        expect { JapanPostcoder.to_address("214003") }.to raise_error(JapanPostcoder::InvalidPostalCodeError, "Invalid postal code. Please make sure the postal code is 7 digits long and only contains numbers.")
      end
    end

    context "when romaji is true" do
      it "returns the address in romaji" do
        expect(JapanPostcoder.to_address("2140037", romaji: true)).to eq("KANAGAWA KEN KAWASAKI SHI TAMA KU NISHI IKUTA")
      end
    end
  end

  describe "::to_address_hash" do
    context "when postal code is valid" do
      it "returns the address in hash format" do
        expect(JapanPostcoder.to_address_hash("2140037")).to eq({ postcode: "2140037", prefecture: "神奈川県", city: "川崎市", ward: "多摩区", district: "西生田" })
      end
    end

    context "when postal code is invalid" do
      it "raises JapanPostcoder::InvalidPostalCodeError" do
        expect { JapanPostcoder.to_address_hash("214003") }.to raise_error(JapanPostcoder::InvalidPostalCodeError, "Invalid postal code. Please make sure the postal code is 7 digits long and only contains numbers.")
      end
    end

    context "when romaji is true" do
      it "returns the address in romaji" do
        expect(JapanPostcoder.to_address_hash("2140037", romaji: true)).to eq({ postcode: "2140037", prefecture: "KANAGAWA KEN", city: "KAWASAKI SHI", ward: "TAMA KU", district: "NISHI IKUTA" })
      end
    end
  end
end
