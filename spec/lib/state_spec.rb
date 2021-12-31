# frozen_string_literal: true

require "spec_helper"

RSpec.describe GR::State do
  describe "#all" do
    subject { described_class.all }

    it { expect(subject).to have_attributes(count: 1169) }
  end

  describe "#find(name:, country:)" do
    subject { described_class.find(name: name, country: country) }

    context "when state and name arent empty" do
      let(:country) { "BR"          }
      let(:name)    { "Sao Paulo"   }

      it { expect(subject).to have_attributes(count: 1) }
    end

    context "when name is empty" do
      let(:country) { "BR" }
      let(:name) { nil }

      it { expect(subject).to have_attributes(count: 27) }
    end

    context "when country is empty" do
      let(:country) { nil }
      let(:name) { "Sao Paulo" }

      it { expect(subject).to have_attributes(count:  1) }
    end
  end
end
