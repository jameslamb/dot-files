# R

Files used with R.

I sometimes change values in the following files.

* `${HOME}/.R/Makevars`
    - customizes R's behavior when building packages from sources
* `${HOME}/.config/rstudio/rstudio-prefs.json`
    - preferences for RStudio, my preferred IDE for R

To make debugging simpler and prevent the risk of "well it worked on my machine" types of issues, I never edit any of the following:

* `.Renviron` / `.Renviron.site`
* `.Rprofile` / `.Rprofile.site`

## References

* https://stackoverflow.com/a/23414789/3986677
* https://community.rstudio.com/t/is-there-a-way-to-enable-multithreading-while-installing-compiling-packages/5519/2
* https://stat.ethz.ch/R-manual/R-devel/library/base/html/Startup.html
