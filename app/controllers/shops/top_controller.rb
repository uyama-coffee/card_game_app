class Shops::TopController < ApplicationController
  before_action :authenticate_shop

  def index
  end
end
