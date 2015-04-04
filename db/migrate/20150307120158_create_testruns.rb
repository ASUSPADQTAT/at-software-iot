class CreateTestruns < ActiveRecord::Migration
  def change
    create_table :testruns do |t|
      t.string :TestRun_Time
      t.string :TestRun_Path
      t.string :Product
      t.string :Project
      t.string :SerialNumber
      t.string :DeviceVersion
      t.string :AndroidVersion
      t.string :SKU
      t.string :ApkSKU
      t.string :TestRun_TotalAppsCount
      t.string :TestRun_TotalFailCount
      t.string :TestRun_InstallFailCount
      t.string :TestRun_LaunchRunningFail
      t.string :TestRun_MonkeyRunningFail
      t.string :TestRun_PassRate


      t.timestamps null: false
    end
  end
end
