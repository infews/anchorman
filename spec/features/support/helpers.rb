module Helpers

  def tmp_dir
    "tmp/aruba"
  end

  def clean_tmp_dir
    FileUtils.rm_rf tmp_dir
  end

  def cd_tmp_aruba
    FileUtils.mkdir_p tmp_dir
    Dir.chdir tmp_dir do
      yield
    end
  end

  def init_git_repo
    cd_tmp_aruba do
      system "git init ."
    end
  end

end

World Helpers
