#' Basic arithmetic
#'
#' @param a a
#' @param b a
#'
#' @export
#' @rdname operators
`%+=%` <- function(a, b) {
  a_name <- deparse(substitute(a))
  b_name <- paste0("c(", paste0(b, collapse = ", "), ")")
  expression <- paste0(a_name, "<-", a_name, "+", b_name)
  eval(parse(text = expression),  parent.frame())
  invisible()
}

#' @rdname operators
#' @export
`%-=%` <- function(a, b) {
  a_name <- deparse(substitute(a))
  expression <- paste(a_name, "<-", a_name, "-", b)
  eval(parse(text = expression),  parent.frame())
  invisible()
}

#' @rdname operators
#' @export
`%*=%` <- function(a, b) {
  a_name <- deparse(substitute(a))
  expression <- paste(a_name, "<-", a_name, "*", b)
  eval(parse(text = expression),  parent.frame())
  invisible()
}

#' @rdname operators
#' @export
`%/=%` <- function(a, b) {
  a_name <- deparse(substitute(a))
  expression <- paste(a_name, "<-", a_name, "/", b)
  eval(parse(text = expression),  parent.frame())
  invisible()
}

#' @rdname operators
#' @export
`%^=%` <- function(a, b) {
  a_name <- deparse(substitute(a))
  expression <- paste(a_name, "<-", a_name, "^", b)
  eval(parse(text = expression),  parent.frame())
  invisible()
}

#' @rdname operators
#' @export
`%**=%` <- function(a, b) {
  a_name <- deparse(substitute(a))
  expression <- paste(a_name, "<-", a_name, "**", b)
  eval(parse(text = expression),  parent.frame())
  invisible()
}

#' @rdname operators
#' @export
`%mod=%`<- function(a, b) {
  a_name <- deparse(substitute(a))
  expression <- paste(a_name, "<-", a_name, "%%", b)
  eval(parse(text = expression),  parent.frame())
  invisible()
}
