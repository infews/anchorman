require 'spec_helper'

describe Anchorman::HtmlConverter do

  it 'returns an HTML filename' do
    path = "foo/bar.md"
    html_converter = Anchorman::HtmlConverter.new(path: path)

    html_converter.filename.should == "bar.html"
  end

  it 'asks the converter to make markdown' do
    converter = double("converter", markdown: "")
    repo = double("repo", gfm_context: "infews/anchorman")
    path = File.join File.dirname(__FILE__), '..', '..', 'release_notes', 'sample.md'
    text = File.read(path)
    html_converter = Anchorman::HtmlConverter.new(path: path,
                                                  converter: converter,
                                                  repo: repo)

    html_converter.html

    expect(converter).to have_received(:markdown).with(text, {mode: 'gfm', context: 'infews/anchorman'})
  end

end