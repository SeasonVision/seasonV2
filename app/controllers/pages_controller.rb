class PagesController < ApplicationController
  before_action :authenticate_user!, except: [ :home ]

  def home
  end

  def calendar
  end

  def tracking
  end

  def insights
  end

  def profile
  end
end
