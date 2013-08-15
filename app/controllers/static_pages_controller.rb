class StaticPagesController < ApplicationController
  def index
  end

  def home
    @sectors = Sector.order("id asc").all
  end
end
