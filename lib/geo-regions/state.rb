# frozen_string_literal: true

class GR::State
  attr_reader :code, :country, :name

  POS = ::GR::Geolite::StatePositions.freeze

  def initialize(code: nil, country: nil, name: nil)
    @code = code
    @country = country
    @name = name
  end

  def self.all
    self.find # shortcut with no args
  end

  def self.find(country: nil, name: nil)
    helper = ::GR::ParseHelper

    country = helper.sanatize_code(country)
    name = helper.sanatize_name(name)

    states = []

    File.foreach(::GR::Geolite::DB_STATES) do |line|
      rec = line.split(",")

      next if rec[0] == "continent_code"

      continent_code = helper.sanatize_code(rec[POS.continent_code])
      continent_name = helper.sanatize_name(rec[POS.continent_name])
      country_code = helper.sanatize_code(rec[POS.country_code])
      country_name = helper.sanatize_name(rec[POS.country_name])
      state_code = helper.sanatize_code(rec[POS.state_code])
      state_name = helper.sanatize_name(rec[POS.state_name])
      state_name = state_code if state_name.nil?

      next if state_name.nil?
      next if states.select { |s| s.code == state_code }.any?
      next if country && country_code != country
      next if name && !state_name.include?(name)

      state = new(
        code: state_code,
        name: state_name,
        country: ::GR::Country.new(
          code: country_code,
          name: country_name,
          continent: ::GR::Continent.new(code: continent_code, name: continent_name)
        )
      )

      states << state
    end

    states
  end
end
