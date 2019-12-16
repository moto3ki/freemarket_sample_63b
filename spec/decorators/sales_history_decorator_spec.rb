# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SalesHistoryDecorator do
  let(:sales_history) { SalesHistory.new.extend SalesHistoryDecorator }
  subject { sales_history }
  it { should be_a SalesHistory }
end
