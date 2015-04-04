
require 'json'
class TestrunsController < ApplicationController
	skip_before_action :verify_authenticity_token
	def index
		@testruns = Testrun.all
   # @app = App.find(1)
	end

	def new
    file = File.read('report.json')
    data_hash = JSON.parse(file)

    tr = Testrun.new

    tr.TestRun_Time = data_hash["TestRun_Time"]
    tr.Product     = data_hash["Product"]
    tr.Project     = data_hash["Project"]
    tr.SerialNumber = data_hash["SerialNumber"]
    tr.DeviceVersion = data_hash["DeviceVersion"]
    tr.AndroidVersion = data_hash["AndroidVersion"]
    tr.SKU  = data_hash["SKU"]
    tr.ApkSKU = data_hash["APKSKU"]
    tr.TestRun_TotalAppsCount =data_hash["TestRun_TotalAppsCount"]
    tr.TestRun_TotalFailCount =data_hash["TestRun_TotalFailCount"]
    tr.TestRun_InstallFailCount =data_hash["TestRun_InstallFailCount"]
    tr.TestRun_LaunchRunningFail =data_hash["TestRun_LaunchRunningFail"]
    tr.TestRun_MonkeyRunningFail =data_hash["TestRun_MonkeyRunningFail"]
    tr.TestRun_PassRate  =data_hash["TestRun_PassRate"]
    data_hash["TestRun_Apps"].each_with_index { |app,index|
      ap = App.new
      ap.AppLink = app["AppLink"]
      ap.AppNumber = app["AppNumber"]
      ap.AppName = app["AppName"]
      ap.AppVersion =app["AppVersion"]
      ap.AppSKU = app["AppSKU"]
      ap.AppClass =app["AppClass"]
      ap.AppCategory =app["AppCategory"]
      ap.AppPackageName = app["AppPackageName"]
      ap.AppNativeCode = app["AppNativeCode"]
      ap.AppComment = app["AppComment"]
      ap.ApkStatus = app["ApkStatus"]
      ap.ApkResult = app["ApkResult"]
      ap.AppInstallResult = app["AppInstallResult"]
      ap.AppInstallFailReason = app["AppInstallReason"]
      ap.AppLaunchResult =app["AppLaunchResult"]
      ap.AppLaunchFailReason  =app["AppLaunchReason"]
      ap.AppMonkeyResult  =app["AppMonkeyResult"]
      ap.AppMonkeyFailReason  =app["AppMonkeyReason"]
      ap.testrun = tr
      ap.save

    }
    tr.save
    redirect_to testruns_url

	end





	def create
		#POST
		tr = Testrun.new

		tr.TestRun_Time = params[:TestRun_Time]
		tr.Product     = params[:Product]
    tr.Project     = params[:Project]
		tr.SerialNumber = params[:SerialNumber]
		tr.DeviceVersion = params[:DeviceVersion]
		tr.AndroidVersion = params[:AndroidVersion]
    tr.SKU  = params[:SKU]
    tr.ApkSKU = params[:APKSKU]
    tr.TestRun_TotalAppsCount =params[:TestRun_TotalAppsCount]
    tr.TestRun_TotalFailCount =params[:TestRun_TotalFailCount]
    tr.TestRun_InstallFailCount =params[:TestRun_InstallFailCount]
    tr.TestRun_LaunchRunningFail =params[:TestRun_LaunchRunningRail]
    tr.TestRun_MonkeyRunningFail =params[:TestRun_MonkeyRunningFail]
    tr.TestRun_PassRate  =params[:TestRun_PassRate]
    params[:TestRun_Apps].each_with_index {|app, index|
			ap = App.new
      ap.AppLink = app[:AppLink]
			ap.AppNumber = app[:AppNumber]
			ap.AppName = app[:AppName]
			ap.AppVersion =app[:AppVersion]
			ap.AppSKU = app[:AppSKU]
      ap.AppClass =app[:AppClass]
      ap.AppCategory =app[:AppCategory]
      ap.AppPackageName = app[:AppPackageName]
      ap.AppNativeCode = app[:AppNativeCode]
      ap.AppComment = app[:AppComment]
      ap.ApkStatus = app[:ApkStatus]
      ap.ApkResult = app[:ApkResult]
      ap.AppInstallResult = app[:AppInstallResult]
      ap.AppInstallFailReason = app[:AppInstallReason]
      ap.AppLaunchResult =app[:AppLaunchResult]
      ap.AppLaunchFailReason  =app[:AppLaunchReason]
      ap.AppMonkeyResult  = app[:AppMonkeyResult]
      ap.AppMonkeyFailReason = app[:AppMonkeyReason]
			ap.testrun = tr
			ap.save

		}
	    tr.save

		redirect_to testruns_url
	end



	def edit

	end


	def show
		redirect_to testruns_url
	end

	def destroy
		@testrun = Testrun.find(params[:id])

    @testrun.apps.destroy_all
    @testrun.destroy
		flash[:alert] = "event was successfully deleted"
		redirect_to testruns_url
	end

	def testrun_params
		params.require(:testrun).permit(:TestRun_Time)
	end

end
