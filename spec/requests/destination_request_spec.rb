RSpec.describe "Destinations" do

  describe "GET /index" do
    it "returns http success" do
      get "/destinations"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/destinations/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    let!(:destination) { create(:destination) }
    it "returns http success" do
      get "/destinations/#{destination.id}/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    let!(:destination) { create(:destination) }
    it "returns http success" do
      get "/destinations/#{destination.id}"
      expect(response).to have_http_status(:success)
    end
  end

end
