class CategoriesController < ApplicationController
  before_filter :set_category, only: [:show]

  def index
    @categories = Category.all
  end

  def show
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end
end