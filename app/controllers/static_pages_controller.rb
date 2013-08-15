class StaticPagesController < ApplicationController
  def home
    @sectors = Sector.order("id asc").all
  end
end
