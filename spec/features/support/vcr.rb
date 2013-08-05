require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :webmock
  c.default_cassette_options = {
      :record => ENV['TRAVIS'] ? :none : :once
  }
  c.configure_rspec_metadata!
end

VCR.cucumber_tags do |t|
  t.tag '@github_markdown'
end
