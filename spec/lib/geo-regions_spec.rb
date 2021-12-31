# frozen_string_literal: true

require "spec_helper"

RSpec.describe GR do
  let(:lib_path) { File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "lib")) }

  describe ".configuration" do
    subject { described_class.configuration }

    context "when there is custom configs present" do
      before do
        described_class.configure do |c|
          c.locale = :"pt-BR"
        end
      end

      it { expect(subject).to have_attributes(
        locale: :pt,
        files_folder: "#{lib_path}/db",
        db_cities: "#{lib_path}/db/cities/GeoLite2-City-Locations-pt.csv",
        db_countries: "#{lib_path}/db/countries/GeoLite2-Country-Locations-pt.csv"
      ) }
    end

    context "when there is custom configs present" do
      before do
        described_class.configuration = nil
      end

      it { expect(subject).to have_attributes(
        locale: :en,
        files_folder: "#{lib_path}/db",
        db_cities: "#{lib_path}/db/cities/GeoLite2-City-Locations-en.csv",
        db_countries: "#{lib_path}/db/countries/GeoLite2-Country-Locations-en.csv"
      ) }
    end
  end
end
