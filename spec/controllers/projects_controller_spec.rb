require 'rails_helper'
#
# describe "db seed tests" do
#   before(:each) do
#     load "#{Rails.root}/db/seeds.rb"
#   end
# end

describe ProjectsController do

  describe '#index' do
    before :all do
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it 'allows logged in users to see only their projects' do
      get :index
      expect(@users).to eq(@user)
    end

    it 'redirects to sign-in page when not logged in' do
      get :index
      expect(response).to redirect_to(signin_path)
    end
  end

  describe '#edit' do

  end

  describe '#new' do

  end

  describe '#create' do

  end

  describe '#update' do

  end

  describe '#destroy' do

  end

end
