# frozen_string_literal: true

class GR::Country
  attr_reader :code, :continent, :name, :is_in_european_union

  POS = ::GR::Geolite::CountryPositions.freeze

  def initialize(code: nil, continent: nil, name: nil, is_in_european_union: 0)
    @code = code
    @continent = continent
    @name = name
    @is_in_european_union = is_in_european_union
  end

  def is_in_european_union?
    is_in_european_union == 1 || is_in_european_union == true
  end

  def self.all
    self.find # shortcut with no args
  end

  def self.find(name: nil)
    helper = ::GR::ParseHelper

    countries = []

    File.foreach(::GR::Geolite::DB_COUNTRIES) do |line|
      rec = line.split(",")

      next if rec[0] == "geoname_id"

      continent_code = helper.sanatize_code(rec[POS.continent_code])
      continent_name = helper.sanatize_code(rec[POS.continent_name])
      country_code = helper.sanatize_code(rec[POS.country_code])
      country_name = helper.sanatize_name(rec[POS.country_name])
      is_in_european_union = helper.sanatize_name(rec[POS.is_in_european_union])

      next if country_name.nil? || country_name == ""
      next if name && !country_name.include?(name)

      country = new(
        code: country_code,
        continent: ::GR::Continent.new(code: continent_code, name: continent_name),
        name: country_name,
        is_in_european_union: is_in_european_union
      )

      countries << country
    end

    countries
  end
end
