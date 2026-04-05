require 'rails_helper'

RSpec.describe Types::Output::AiTool do
  describe 'fields' do
    subject { described_class }

    it { is_expected.to have_field(:name).of_type('String!') }
    it { is_expected.to have_field(:description).of_type('String!') }
    it { is_expected.to have_field(:category).of_type('String!') }
    it { is_expected.to have_field(:url).of_type('String!') }
    it { is_expected.to have_field(:docs_url).of_type('String') }
    it { is_expected.to have_field(:icon).of_type('String') }
    it { is_expected.to have_field(:pricing).of_type('String') }
    it { is_expected.to have_field(:api_available).of_type('Boolean') }
    it { is_expected.to have_field(:tags).of_type('[String!]') }
  end
end
