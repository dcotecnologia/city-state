# frozen_string_literal: true

class GR::Geolite
  DB_CITIES = GR.configuration.db_cities.freeze
  DB_CITIES_VERSION = "2021-12-28"
  DB_COUNTRIES = GR.configuration.db_countries.freeze
  DB_COUNTRIES_VERSION = "2021-12-28"
  DB_STATES = GR.configuration.db_states.freeze
  DB_STATES_VERSION = "2021-12-31"

  class CityPositions
    include Ruby::Enum

    define :geoname_id, 0
    define :locale_code, 1
    define :continent_code, 2
    define :continent_name, 3
    define :country_code, 4
    define :country_name, 5
    define :state_code, 6
    define :state_name, 7
    define :region_code, 8
    define :region_name, 9
    define :city_name, 10
    define :metro_code, 11
    define :time_zone, 12
    define :is_in_european_union, 13
  end

  class CountryPositions
    include Ruby::Enum

    define :geoname_id, 0
    define :locale_code, 1
    define :continent_code, 2
    define :continent_name, 3
    define :country_code, 4
    define :country_name, 5
    define :is_in_european_union, 6
  end

  class StatePositions
    include Ruby::Enum

    define :continent_code, 0
    define :continent_name, 1
    define :country_code, 2
    define :country_name, 3
    define :state_code, 4
    define :state_name, 5
  end
end
