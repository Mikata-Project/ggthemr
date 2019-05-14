do_package_checks()

if (ci_on_travis()) {
  get_stage("install") %>%
    add_step(step_install_cran("gridExtra"))

  do_pkgdown()
}
