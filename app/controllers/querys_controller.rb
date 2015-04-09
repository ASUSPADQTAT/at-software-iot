class QuerysController < ApplicationController


  def index
    @apps = App.all
    @pkg = [] << ''
    @pkg += App.uniq.pluck(:AppPackageName)


    @class = [] << ''
    @class +=App.uniq.pluck(:AppClass)


    @result = [] << ''
    @result += App.uniq.pluck(:ApkResult)

    @manual_result = [] << ''
    @manual_result  += App.uniq.pluck(:TesterResult)


  end


  def search

    @pkg = [] << ''
    @pkg += App.uniq.pluck(:AppPackageName)
    @class = [] << ''
    @class +=App.uniq.pluck(:AppClass)


    @result = [] << ''
    @result += App.uniq.pluck(:ApkResult)

    @manual_result = [] << ''
    @manual_result  += App.uniq.pluck(:TesterResult)

    sql="SELECT * FROM apps WHERE "

    sql_array =[]
    sql_array.push(sql)
      if !params[:AppPackageName].blank?
        sql_param = "AppPackageName = ? and "
        sql_array[0] +=sql_param
        sql_array.push(params[:AppPackageName])
      end
      if !params[:AppClass].blank?
        sql_param = "AppClass = ? and "
        sql_array[0] +=sql_param
        sql_array.push(params[:AppClass])
      end
      if !params[:ApkResult].empty?
        sql_param = "ApkResult = ? and "
        sql_array[0] +=sql_param
        sql_array.push(params[:ApkResult])
      end
      if !params[:TesterResult].empty?
        sql_param = "TesterResult = ? "
        sql_array[0] +=sql_param
        sql_array.push(params[:TesterResult])
      end

      @ral = sql_array[0].end_with? "and "
      sql_array[0]= ( sql_array[0])[0..-5] if(@ral)

      @apps = App.find_by_sql(sql_array)
  end


  def downloadcsv

   @apps = params[:apps]
  #  respond_to do |format|
   #   format.csv { render text: @apps.to_csv }
   # end

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
