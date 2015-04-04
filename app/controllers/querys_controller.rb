class QuerysController < ApplicationController


  def index

    @project  = Testrun.uniq.pluck(:Project)
    @apps = App.all
    @app = App.find(40)

    @pkg  = App.uniq.pluck(:AppPackageName)

    @class =App.uniq.pluck(:AppClass)
    @result = App.uniq.pluck(:ApkResult)
    @mautal_result  = App.uniq.pluck(:TesterResult)
  end





  def show

    @print_show =  params[:hello]


  end

  def create

  end

  def edit

  end

  def destroy

  end


  def hello
    @print_hello =  params[:hello]
  end

end
