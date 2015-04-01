# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150322141727) do

  create_table "apps", force: :cascade do |t|
    t.string   "AppNumber"
    t.string   "AppName"
    t.string   "AppVersion"
    t.string   "AppSKU"
    t.string   "AppClass"
    t.string   "AppCategory"
    t.string   "AppPackageName"
    t.string   "ApkStatus"
    t.string   "ApkResult"
    t.string   "AppInstallResult"
    t.string   "AppLaunchResult"
    t.string   "AppMonkeyResult"
    t.integer  "testrun_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "AppNativeCode"
    t.string   "AppComment"
    t.string   "AppInstallFailReason"
    t.string   "AppLaunchFailReason"
    t.string   "AppMonkeyFailReason"
    t.string   "LaunchLogPath"
    t.string   "MonkeyLogPath"
    t.string   "TTBugID"
    t.string   "BugZillaBugID"
    t.string   "Tester"
    t.string   "TesterResult"
    t.string   "TesterComment"
  end

  create_table "testruns", force: :cascade do |t|
    t.string   "TestRun_Time"
    t.string   "TestRun_Path"
    t.string   "Product"
    t.string   "Project"
    t.string   "SerialNumber"
    t.string   "DeviceVersion"
    t.string   "AndroidVersion"
    t.string   "SKU"
    t.string   "ApkSKU"
    t.string   "TestRun_TotalAppsCount"
    t.string   "TestRun_TotalFailCount"
    t.string   "TestRun_InstallFailCount"
    t.string   "TestRun_LaunchRunningRail"
    t.string   "TestRun_MonkeyRunningFail"
    t.string   "TestRun_PassRate"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
