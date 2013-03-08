module Helpers
  def clean_and_cd_tmp_aruba
    tmp_dir = "tmp/aruba"
    FileUtils.rm_rf tmp_dir
    FileUtils.mkdir_p tmp_dir
    Dir.chdir tmp_dir do
      yield
    end

  end

  def init_git_repo
    clean_and_cd_tmp_aruba do
      system "git init ."
    end
  end

end

World Helpers
