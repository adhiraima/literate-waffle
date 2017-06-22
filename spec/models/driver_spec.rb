require "rails_helper"

RSpec.describe Driver, :type => :model do
  it "creates driver" do
    driver = Driver.create!(latitude: 0.0, longitude: 0.0)
    expect(Driver.find(driver.id).distance).to eq(nil)
    expect(Driver.find(driver.id).latitude).to eq(0.0)
    expect(Driver.find(driver.id).longitude).to eq(0.0)
  end

  it "does not creates driver if latitude is not in range +ve" do
    driver = Driver.new
    driver.latitude = 91.0
    driver.longitude = 0.0
    driver.valid?
    expect(driver.errors[:latitude].size).to eq(1)
    expect(driver.errors[:latitude][0]).to eq('is not in range')
  end

  it "does not creates driver if latitude is not in range -ve" do
    driver = Driver.new
    driver.latitude = -91.0
    driver.longitude = 0.0
    driver.valid?
    expect(driver.errors[:latitude].size).to eq(1)
    expect(driver.errors[:latitude][0]).to eq('is not in range')
  end

  it "does not creates driver if longitude is not in range +ve" do
    driver = Driver.new
    driver.longitude = 91.0
    driver.latitude = 0.0
    driver.valid?
    expect(driver.errors[:longitude].size).to eq(1)
    expect(driver.errors[:longitude][0]).to eq('is not in range')
  end

  it "does not creates driver if longitude is not in range -ve" do
    driver = Driver.new
    driver.longitude = -91.0
    driver.latitude = 0.0
    driver.valid?
    expect(driver.errors[:longitude].size).to eq(1)
    expect(driver.errors[:longitude][0]).to eq('is not in range')
  end
end
