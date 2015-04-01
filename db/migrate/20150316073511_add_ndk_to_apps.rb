class AddNdkToApps < ActiveRecord::Migration
  def change
  	add_column :apps, :AppNativeCode ,:string
  	add_column :apps, :AppComment , :string

  	add_column :apps, :AppInstallFailReason , :string
  	add_column :apps, :AppLaunchFailReason , :string
  	add_column :apps, :AppMonkeyFailReason , :string
  	add_column :apps, :LaunchLogPath , :string
  	add_column :apps, :MonkeyLogPath , :string
    add_column :apps,:TTBugID , :string
    add_column :apps,:BugZillaBugID , :string


  end
end
