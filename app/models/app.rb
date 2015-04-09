class App < ActiveRecord::Base
	belongs_to :testrun



  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |app|
        csv << app.attributes.values_at(*column_names)
      end
    end
  end

end
