# frozen_string_literal: true

class PagesController < ApplicationController # rubocop:todo Style/Documentation
  # above, the < indicates the PagesController is inheriting from ApplicationController
  def home
    # by convention, this expects a home.html.erb template, so no more code necessary
    redirect_to articles_path if logged_in?
  end

  def about; end
end
