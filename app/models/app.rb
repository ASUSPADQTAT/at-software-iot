class App < ActiveRecord::Base
	belongs_to :testrun
  has_one :query
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |app|
        csv << app.attributes.values_at(*column_names)
      end
    end
  end

end
