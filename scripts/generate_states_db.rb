# frozen_string_literal: true

require "geo-regions"
require "csv"

GR::LOCALES.each do |locale|
  GR.configure do |c|
    c.locale = locale.to_sym
  end

  rows = [
    ["continent_code", "continent_name", "country_code", "country_name", "state_code", "state_name"]
  ]

  ::GR::Country.all.each do |ct|
    ::GR::State.find(country: ct.code).each do |s|
      country = s.country
      continent = s.country.continent

      rows << [continent.code, continent.name, country.code, country.name, s.code, s.name]
    end
  end

  File.delete("lib/db/states/#{locale}.csv") if File.exist?("lib/db/states/#{locale}.csv")
  File.write("lib/db/states/#{locale}.csv", rows.map(&:to_csv).join)
end
