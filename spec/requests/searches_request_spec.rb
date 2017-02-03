require 'rails_helper'

RSpec.describe "Search", type: :request do

  describe 'GET#index' do
    it "searches" do
      Search.reindex
      expect do
        post searches_path, params: { title: :title }
      end.to change(Search, :count).by(1)
      expect(response).to redirect_to searches_path
    end
  end

  describe 'GET#create' do

    let(:search) { create(:search) }

    it 'saves search table' do
      expect do
        post searches_path, params: { title: :title }
      end.to change(Search, :count).by(1)

      expect do
        post searches_path, params: { title: :title }
      end.to change(Searchjoy::Search, :count).by(1)
    end
  end

end
