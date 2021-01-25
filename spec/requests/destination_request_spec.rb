RSpec.describe "Destinations" do

  let!(:user) { create(:user) }

  describe "GET /index" do
    let(:url) {"/destinations.json"}
    let!(:destinations) { create_list(:destination,5) }
    
    it "returns http not authenticated" do
      get "/destinations"
      expect(response).to have_http_status(302)  
    end

    it "return all destinations" do
      sign_in user
      get url
      expect(body_json).to contain_exactly *destinations.as_json(only: %i(id place description))
    end
    
    it "returns http success" do
      sign_in user
      get url
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    
    let!(:destination_params) { {destination: attributes_for(:destination)} }

    it "add new Destination" do
      sign_in user
      expect do
        post "/destinations", params: destination_params
      end.to change(Destination, :count).by(1)
    end
    
    it "returns http success" do
      sign_in user
      get "/destinations/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    let!(:destination) { create(:destination) }

    it "returns http success" do
      sign_in user
      get "/destinations/#{destination.id}/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    let!(:destination) { create(:destination) }

    it "returns http success" do
      sign_in user
      get "/destinations/#{destination.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
