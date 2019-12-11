# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TodolistDecorator do
  let(:todolist) { Todolist.new.extend TodolistDecorator }
  subject { todolist }
  it { should be_a Todolist }
end
