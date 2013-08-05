require 'spec_helper'

describe Anchorman::GitHubRepo do

  it 'exposes the GitHub username of the repo' do
    repo = Anchorman::GitHubRepo.new("http://github.com/foo/bar.git")

    repo.username.should eq("foo")
  end

  it 'exposes the GitHub repo name' do
    repo = Anchorman::GitHubRepo.new("http://github.com/foo/bar.git")

    repo.name.should eq("bar")
  end

  it 'exposes the context for GitHub-Flavored Markdown' do
    repo = Anchorman::GitHubRepo.new("http://github.com/foo/bar.git")

    repo.gfm_context.should eq("foo/bar")
  end
end