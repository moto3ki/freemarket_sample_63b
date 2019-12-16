# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RateDecorator do
  let(:rate) { Rate.new.extend RateDecorator }
  subject { rate }
  it { should be_a Rate }
end
