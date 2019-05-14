if (ci_has_env("INSTALL_DEV_VERSIONS")) {
  get_stage("install") %>%
    add_step(step_install_github(c("r-lib/scales", "tidyverse/ggplot2")))
}

do_package_checks()

if (ci_on_travis() && ci_has_env("BUILD_PKGDOWN")) {
  get_stage("install") %>%
    add_step(step_install_cran("gridExtra"))

  do_pkgdown()
}
