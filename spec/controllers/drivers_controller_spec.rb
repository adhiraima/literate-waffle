require "rails_helper"

RSpec.describe DriversController, :type => :controller do
  describe "GET #list" do
    it "responds successfully with an HTTP 200 status code and fetches the driver list" do
      Driver.create(latitude: 0.0, longitude: 0.0)
      get :list, params: { latitude: 0.0, longitude: 0.0 }
      expect(response.body['drivers'].size).to eq(7)
      expect(response.status).to eq(200)
    end
  end

  describe "PUT #update_position" do
    it "responds successfully with an HTTP 200 status code and updates driver location" do
      driver = Driver.create!(latitude: 0.0, longitude: 0.0)
      put :update_position, params: {id: driver.id, latitude: 10.0, longitude: 11.0 }
      expect(response.status).to eq(200)
      expect(Driver.find(driver.id).latitude).to eq(10.0)
      expect(Driver.find(driver.id).longitude).to eq(11.0)
    end
  end
end
