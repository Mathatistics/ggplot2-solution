is_latex <- function() {
  identical(knitr::opts_knit$get("rmarkdown.pandoc.to"), "latex")
}

columns <- function(n, aspect_ratio = 1, max_width = if (n == 1) 0.65 else 1) {
  if (is_latex()) {
    out_width <- paste0(round(max_width / n, 3), "\\linewidth")
    # knitr::knit_hooks$set(plot = plot_hook_bookdown)
  } else {
    out_width <- paste0(round(max_width * 100 / n, 1), "%")
  }

  width <- 6 / n * max_width

  knitr::opts_chunk$set(
    fig.width = width,
    fig.height = width * aspect_ratio,
    fig.align = if (max_width < 1) "center" else "default",
    fig.show = if (n == 1) "asis" else "hold",
    fig.retina = NULL,
    out.width = out_width,
    out.extra = if (!is_latex())
      paste0("style='max-width: ", round(width, 2), "in'")
  )
}
