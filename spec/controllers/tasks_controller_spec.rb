require 'rails_helper'
#
# describe "db seed tests" do
#   before(:each) do
#     load "#{Rails.root}/db/seeds.rb"
#   end
# end

describe TasksController do
  describe '#index' do
    it 'allows logged in users to see only their projects' do
      p User.all
      get :index

    end

    it 'redirects to sign-in page when not logged in' do

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
