class AppsController < ApplicationController
  require 'csv'
  def index

    sort_by =(params[:order] == 'AppNumber')? 'AppNumber' : 'created_at'
    @apps = App.order(sort_by).page(params[:page]).per(100)


  end

  def search
  end

  def show

  end

  def create

  end

  def edit

  end

  def destroy

  end
end
