Given /^A directory without a git repo$/ do
  # nothing to do here
end

Given /^A git repo with no commits$/ do
  clean_tmp_dir
  init_git_repo
end

Given(/^A git repo with commits$/) do
  clean_tmp_dir
  init_git_repo
  config_git
  commit "This is a commit message"
end