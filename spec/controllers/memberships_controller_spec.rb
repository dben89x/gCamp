require 'rails_helper'

describe MembershipsController do
  describe '#index' do
    it 'renders the index template ' do
      get :index
      expect(response).to render_template("index")
    end

    it 'redirects to signin if not signed in' do
      get :index
      expect(response).to redirect_to(signin_path)
    end
  end

  describe '#create' do
    it 'makes current user an owner' do
    end
  end

  describe '#update' do

  end

  describe '#destroy' do

  end
end
