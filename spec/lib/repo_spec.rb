require 'spec_helper'

describe Anchorman::Repo do

  describe "when origin is github" do
    subject(:github_repo) do
      remote = double("git remote",
                      url: "https://github.com/foobar/myrepo.git",
                      name: "origin")
      repo = double("repo", remote: remote)

      Anchorman::Repo.new(repo)
    end

    it "reports that it is a github repo" do
      github_repo.is_github?.should be_true
    end

    it "provides a commit URL" do
      github_repo.commit_url('abc123').should == "[abc123](https://github.com/foobar/myrepo/commits/abc123)"
    end
  end

  describe "when origin is not github" do
    subject(:other_repo) do
      remote = double("git remote",
                      url: "https://mysite.com/foobar/myrepo.git",
                      name: "origin")
      repo = double("repo", remote: remote)

      Anchorman::Repo.new(repo)
    end

    it "reports that it is not github repo" do
      other_repo.is_github?.should be_false
    end

    it "provides a commit URL" do
      other_repo.commit_url('abc123').should == 'abc123'
    end
  end
end