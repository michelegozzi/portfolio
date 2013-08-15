class StaticPagesController < ApplicationController
  def index
  end

  def home
    @sectors = Sector.all
  end
end
