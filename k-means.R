# K-means algorithm and 3d visualization of it.

# Library for 3d visualization.
library(rgl)

get_iris <- function() {
  data(iris)
  iris$Species <- factor(iris$Species,
    levels = c("versicolor", "virginica", "setosa"))
  iris
}

get_scores <- function(iris) {
  princomp(iris[, 1:4], cor=TRUE, scores=TRUE)$scores[, 1:3]
}

clusters <- function(iris) {
  as.factor(kmeans(iris[, 1:4], 3)$cluster)
}

iris <- get_iris()
scores <- get_scores(iris)
iris$clusters <- clusters(iris)
plot3d(scores, col = iris$clusters, main = "k-means clusters")