# frozen_string_literal: true

require "ruby-enum"
require "yaml"

module GR
  LOCALES = [ :en, :de, :es, :fr, :ja, :pt, :ru, :zh ].freeze

  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end
  end

  def self.configure
    self.configuration ||= Configuration.new

    yield(configuration)
  end

  class Configuration
    attr_writer :locale, :files_folder, :db_cities, :db_countries, :db_states

    def locale
      @locale ||= I18n.locale
      @locale = @locale.to_s.downcase.split("-")[0].to_sym
      @locale = :en unless ::GR::LOCALES.include?(@locale)
      @locale
    end

    def files_folder
      File.expand_path("../db", __FILE__)
    end

    def db_cities
      File.join(files_folder, "cities/GeoLite2-City-Locations-#{locale}.csv")
    end

    def db_countries
      File.join(files_folder, "countries/GeoLite2-Country-Locations-#{locale}.csv")
    end

    def db_states
      File.join(files_folder, "states/#{locale}.csv")
    end
  end

  require "geo-regions/version"
  require "geo-regions/geolite"
  require "geo-regions/parse_helper"
  require "geo-regions/city"
  require "geo-regions/continent"
  require "geo-regions/country"
  require "geo-regions/state"
end
