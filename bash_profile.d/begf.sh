function begf() {
  beg $@ -w `git_directories_changed_vs_origin_master` || return $?
}
