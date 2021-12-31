# frozen_string_literal: true

module GR
  class City
    attr_reader :name, :state, :time_zone

    POS = ::GR::Geolite::CityPositions.freeze

    def initialize(name: nil, state: nil, time_zone: nil)
      @name = name
      @state = state
      @positions = ::GR::Geolite::CityPositions
      @time_zone = time_zone
    end

    def self.all
      self.find # shortcut with no args
    end

    def self.find(state: nil, country: nil, name: nil, sort_by: nil)
      helper = ::GR::ParseHelper

      country = helper.sanatize_code(country)
      name = helper.sanatize_name(name)
      state = helper.sanatize_code(state)

      cities = []

      File.foreach(::GR::Geolite::DB_CITIES) do |line|
        rec = line.split(",")

        next if rec[0] == "geoname_id"

        city_name = helper.sanatize_name(rec[POS.city_name])
        continent_code = helper.sanatize_code(rec[POS.continent_code])
        continent_name = helper.sanatize_code(rec[POS.continent_name])
        country_code = helper.sanatize_code(rec[POS.country_code])
        country_name = helper.sanatize_name(rec[POS.country_name])
        state_code = helper.sanatize_code(rec[POS.state_code])
        state_name = helper.sanatize_name(rec[POS.state_name])
        time_zone = helper.sanatize_name(rec[POS.time_zone])
        state_name = state_code if state_name.nil?

        next if city_name.nil? || city_name == ""
        next if country && country_code != country
        next if state && state_code != state
        next if name && !city_name.include?(name)

        city = new(
          name: city_name,
          state: State.new(
            code: state_code,
            name: state_name,
            country: Country.new(
              code: country_code,
              name: country_name,
              continent: Continent.new(code: continent_code, name: continent_name)
            )
          ),
          time_zone: time_zone
        )

        cities << city
      end

      cities = ::GR::ParseHelper.sort_by(list: cities, field: sort_by) if sort_by
      cities
    end
  end
end
