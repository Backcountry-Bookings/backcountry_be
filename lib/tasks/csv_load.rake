require 'csv'

namespace :csv_load do
  task campsites: :environment do
    CSV.foreach('./db/data/result.csv', headers: true) do |row|
      Campsite.create!(row.to_hash)
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('campsites')
  end
end