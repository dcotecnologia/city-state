# frozen_string_literal: true

require "spec_helper"

RSpec.describe GR::City do
  describe "#all" do
    subject { described_class.all }

    it { expect(subject).to have_attributes(count: 136885) }
  end

  describe "#find(state:, country:)" do
    subject { described_class.find(state: state, country: country, sort_by: sort_by) }

    let(:sort_by) { nil }

    context "when state and country arent empty" do
      let(:country) { "BR"   }
      let(:state)   { "SP"   }

      it { expect(subject).to have_attributes(count: 657) }

      context "when sorting by name" do
        let(:sort_by) { :name }

        it { expect(subject.first.name).to eq("Adamantina") }

        it { expect(subject.last.name).to eq("Votuporanga") }
      end
    end

    context "when state is empty" do
      let(:country) { "BR"   }
      let(:state)   { nil    }

      it { expect(subject).to have_attributes(count: 7449) }
    end

    context "when country is empty" do
      let(:country) { nil }
      let(:state) { "SP" }

      it { expect(subject).to have_attributes(count:  658) }
    end
  end
end
