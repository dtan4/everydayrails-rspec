require "spec_helper"

describe Phone, type: :model do
  it "does not allow duplicate phone numbers per contact" do
    contact = create(:contact)
    create(:home_phone,
           contact: contact,
           phone: "123-456-789")
    mobile_phone = build(:mobile_phone,
                          contact: contact,
                          phone: "123-456-789")
    expect(mobile_phone).to have(1).errors_on(:phone)
  end

  it "allows two contacts to share a phone number" do
    create(:home_phone, phone: "123-456-789")
    other_phone = build(:home_phone, phone: "123-456-789")
    expect(other_phone).to be_valid
  end
end
