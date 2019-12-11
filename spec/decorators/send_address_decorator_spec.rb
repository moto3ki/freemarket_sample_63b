# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SendAddressDecorator do
  let(:send_address) { SendAddress.new.extend SendAddressDecorator }
  subject { send_address }
  it { should be_a SendAddress }
end
