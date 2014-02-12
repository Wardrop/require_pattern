require_relative '../lib/require_pattern'
Dir.chdir File.expand_path('../dummy', __FILE__)

describe 'require_pattern' do
  it "requires relative to the current working directory by default" do
    require_pattern 'colors/*.rb'
    $red.should be_true
    $green.should be_true
  end

  it "can require relative to the current file" do
    require_relative_pattern 'dummy/sizes/*.rb'
    $tall.should be_true
    $short.should be_true
  end
  
  it "overcomes file ordering issues by intelligently retrying" do
    require_relative_pattern 'dummy/dependancies/*.rb'
    Golf
  end
  
  it "reports true only if a file was loaded" do
    require_pattern('loaded.rb').should be_true
    require_pattern('loaded.rb').should be_false
  end
  
  it "can take multiple patterns" do
    require_pattern('colors/*.rb', 'shapes/*.rb').should be_true
    $circle.should be_true
    $square.should be_true
  end
  
  it "outputs to STDERR on failure" do
    STDERR.should_receive(:puts).at_least(2).times
    expect {
      require_pattern 'bad.*'
    }.to raise_error(LoadError)
  end
  
  it "doesn't care if it doesn't match any files" do
    require_pattern('good luck matching this').should be_false
  end
end