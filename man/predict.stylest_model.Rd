% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generics.R
\name{predict.stylest_model}
\alias{predict.stylest_model}
\title{Predict the Authors of Documents}
\usage{
\method{predict}{stylest_model}(object, newdata, type = c("predicted",
  "probs", "logprobs"), ...)
}
\arguments{
\item{object}{A fitted stylest_model}

\item{newdata}{A character vector of texts, corpus::corpus_frame, or
quanteda::corpus object}

\item{type}{Type of prediction "\code{predicted}" (the default),
"\code{logprobs}" or "\code{probs}". See below for details}

\item{...}{Other arguments (ignored)}
}
\value{
a data frame of author predictions
}
\description{
This function returns a data frame with documents as
rownames and author predictions as columns.
}
\details{
If \code{type} is "\code{predicted}" the columns are
"\code{author}", a character vector of predicted author names, and
"\code{prob}", the posterior probability of this author assignment under the model.
If \code{type} is "\code{logprobs}" there are as many columns as possible
authors and each element of the data frame is
the log posterior probability the model assigns to each author and
document.  If \code{type} is "\code{probs}", each element is the posterior
probability that a document is assigned to an author relative to all the
others.  This is constructed from the log posterior by inverse logistic
transformation, a.k.a. 'softmax'.

Note: if \code{newdata} is a quanteda::corpus then quanteda's \code{docnames}
may return generic names.  These are currently "text1", "text2", etc.
}
\examples{
data(novels_excerpts)
speaker_mod <- stylest_fit(novels_excerpts$text, novels_excerpts$author)
predict(speaker_mod, "This is an example text, who wrote it?", type = "probs")
}
