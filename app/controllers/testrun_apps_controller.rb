class TestrunAppsController < ApplicationController
	skip_before_action :verify_authenticity_token


    def index
      sort_by =(params[:order] == 'AppNumber')? 'AppNumber' : 'created_at'
      @testrun = Testrun.find( params[:testrun_id])
      if params[:AppClass]
        @apps = @testrun.apps.where(:AppClass => params[:AppClass])
        .order(sort_by).page(params[:page]).per(100)
      elsif params[:AppNativeCode]
        @apps = @testrun.apps.where("AppNativeCode LIKE ? "    , "#{params[:AppNativeCode]}%")
        .order(sort_by).page(params[:page]).per(100)
      elsif  params[:ApkResult] && params[:ApkResult] != "All"
        @apps = @testrun.apps.where(:ApkResult => params[:ApkResult])
        .order(sort_by).page(params[:page]).per(100)
      elsif params[:AppInstallResult]
        @apps = @testrun.apps.where(:AppInstallResult => params[:AppInstallResult])
        .order(sort_by).page(params[:page]).per(100)
      elsif params[:AppLaunchResult]
        @apps = @testrun.apps.where(:AppLaunchResult  => params[:AppLaunchResult])
        .order(sort_by).page(params[:page]).per(100)
      else

        @apps = @testrun.apps.order(sort_by).page(params[:page]).per(100)
      end
    end


    def show
      @testrun = Testrun.find(params[:testrun_id])
    	@app =@testrun.apps.find(params[:id])
    end

    def edit
      @testrun = Testrun.find(params[:testrun_id])
      @app = @testrun.apps.find(params[:id])
    end


  def new
    	@app = @testrun.apps.build
    end


    def create
      @testrun = Testrun.find(params[:testrun_id])
    	@app = @testrun.apps.build(app_params)
    	if @app.save
    		redirect_to testrun_apps_url (@testrun)
    	else
    			render :action => :new
    	end
    end


    def update
      @testrun = Testrun.find(params[:testrun_id])
      @app = @testrun.apps.find(params[:id])
    	if @app.update(:Tester => params.require(:app)[:Tester],
                     :TesterResult => params.require(:app)[:TesterResult],
                     :TesterComment => params.require(:app)[:TesterComment],
                     :TTBugID => params.require(:app)[:TTBugID],
                     :BugZillaBugID => params.require(:app)[:BugZillaBugID])
    		redirect_to testrun_apps_url (@testrun)
    	else
    		render :action => :edit
    	end
    end

    def destroy
      @testrun = Testrun.find( params[:testrun_id])
    	@app = @testrun.apps.find(params[:id])
    	@app.destroy
    	redirect_to testrun_apps_url(@testrun)
    end

  	protected
  	def find_testrun
  		@testrun = Testrun.find( params[:testrun_id])
  	end

  	def app_params
  		params.require(:app).permit(:AppPackageName)
    end

    

end
