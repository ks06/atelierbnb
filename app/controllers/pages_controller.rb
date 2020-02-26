class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  skip_before_action :show_navbar


  def home

  end

  def search

  end
end
