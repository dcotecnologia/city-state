# frozen_string_literal: true

require "spec_helper"

RSpec.describe GR::Country do
  describe "#all" do
    subject { described_class.all }

    it { expect(subject).to have_attributes(count: 250) }
  end

  describe "#is_in_european_union?" do
    subject { described_class.new(is_in_european_union: flag).is_in_european_union? }

    context "when the flag is true" do
      let(:flag) { true }

      it { expect(subject).to be_truthy }
    end

    context "when the flag is false" do
      let(:flag) { false }

      it { expect(subject).to be_falsey }
    end

    context "when the flag is nil" do
      let(:flag) { nil }

      it { expect(subject).to be_falsey }
    end
  end
end
