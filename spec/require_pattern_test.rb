require 'bundler'
Bundler.setup
require "maxitest/autorun"
require "mocha/mini_test"

require_relative '../lib/require_pattern'
Dir.chdir File.expand_path('../dummy', __FILE__)

describe 'require_pattern' do
  it "requires relative to the current working directory by default" do
    require_pattern 'colors/*.rb'
    $red.must_equal true
    $green.must_equal true
  end

  it "can require relative to the current file" do
    require_relative_pattern 'dummy/sizes/*.rb'
    $tall.must_equal true
    $short.must_equal true
  end

  it "overcomes file ordering issues by intelligently retrying" do
    require_relative_pattern 'dummy/dependancies/*.rb'
    Golf
  end

  it "reports true only if a file was loaded" do
    require_pattern('loaded.rb').must_equal true
    require_pattern('loaded.rb').wont_equal true
  end

  it "can take multiple patterns" do
    require_pattern('colors/*.rb', 'shapes/*.rb').must_equal true
    assert $circle
    assert $square
  end

  it "outputs to STDERR on failure" do
    STDERR.expects(:puts).at_least(2)
    lambda {
      require_pattern 'bad.*'
    }.must_raise LoadError
  end

  it "doesn't care if it doesn't match any files" do
    require_pattern('good luck matching this').must_equal false
  end
end
