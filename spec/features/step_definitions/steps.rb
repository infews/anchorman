Given /^A directory without a git repo$/ do
  # nothing to do here
end

Given /^A git repo with no commits$/ do
  clean_tmp_dir
  init_git_repo
end

Given /^A git repo with commits$/ do
  clean_tmp_dir
  init_git_repo
  config_git
  commit "This is a commit message"
end

Given /^A repo with plenty of refs$/ do
  clean_tmp_dir
  init_git_repo
  config_git
  commit "This is a commit message"
  tag "tagA"
  commit "This is another commit"
  tag "tagB"
  commit "This is yet another commit"
end
