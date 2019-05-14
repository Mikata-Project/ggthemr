do_package_checks()

if (ci_on_travis()) {
  get_stage("install") %>%
    step_install_cran("gridExtra")

  do_pkgdown()
}
