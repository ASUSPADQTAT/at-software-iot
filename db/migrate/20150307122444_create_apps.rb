class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :AppNumber
      t.string :AppLink
      t.string :AppName
      t.string :AppVersion
      t.string :AppSKU
      t.string :AppClass
      t.string :AppCategory
      t.string :AppPackageName
      t.string :ApkStatus
      t.string :ApkResult
      t.string :AppInstallResult
      t.string :AppLaunchResult
      t.string :AppMonkeyResult
      t.integer :testrun_id

      t.timestamps null: false
    end
  end
end
