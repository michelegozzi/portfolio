require 'spec_helper'

describe Admin::DataController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'upload'" do
    it "returns http success" do
      get 'upload'
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      get 'update'
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy'
      response.should be_success
    end
  end

end
