require 'spec_helper'
require "active_record"
require 'mock_model'

describe Utf8AttributeSanitiser do
  let(:mock_model) { MockModel.new }

  it "should define Utf8AttributeSanitiser" do
    expect(Object.const_defined?(:Utf8AttributeSanitiser)).to be true
  end

  it "should respond to utf8_attribute_sanitiser method" do
    expect(MockModel.respond_to?("utf8_attribute_sanitiser")).to be true
  end

  it 'does not trigger argument error when saving a string with invalid utf8 characters' do
    expect { mock_model.valid? }.not_to raise_error
  end

  it 'strips out invalid utf8 characters' do
    mock_model.name = "Test\255"
    mock_model.valid?
    expect(mock_model.name).to eq "Test"
  end

  it "does not affect valid strings" do
    mock_model.name = "Teststring"
    mock_model.valid?
    expect(mock_model.name).to eq "Teststring"
  end

  it 'does not affect non-string attributes' do
    mock_model.age = 25
    mock_model.valid?
    expect(mock_model.age).to eq 25
  end
end
