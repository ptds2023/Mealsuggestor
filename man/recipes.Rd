\name{recipes}
\alias{recipes}
\docType{data}
\title{
Recipes for mealgenerator
}
\description{
A dataset containing various recipes with details such as cuisine, diet, ingredients, and rating in order to be used in our package.
}
\format{
  A data frame with 6503 observations on the following 10 variables.
  \describe{
    \item{\code{recipe_title}}{a character vector}
    \item{\code{rating}}{a numeric vector}
    \item{\code{description}}{a character vector}
    \item{\code{cuisine}}{a character vector}
    \item{\code{course}}{a character vector}
    \item{\code{diet}}{a character vector}
    \item{\code{prep_time}}{a numeric vector}
    \item{\code{cook_time}}{a numeric vector}
    \item{\code{ingredients}}{a character vector}
    \item{\code{instructions}}{a character vector}
  }
}
\source{
\url{https://www.kaggle.com/datasets/sarthak71/food-recipes/}
}
\examples{
data(recipes)
## maybe str(recipes) ; plot(recipes) ...
}
\keyword{recipes}
