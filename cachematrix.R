## These two functions create a special object that stores a matrix and cache's inverse

## The first function makeCacheMatrix creates a special matrix which is a list that set and get the value of the matrix and set and get its inverse.
makeCacheMatrix <- function(x = matrix()) {
m<- NULL
set <- function(y) {
  x <<- y
  m <<- NULL
}
get <- function() x
setvector <- function(vector) m <<- vector
getvector <- function() m
list(set = set, get = get, 
    setvector = setvector, getvector = getvector)
}


## This function calculates the inverse of the special matrix created with the above function.
## It checks if the matrix has already been calculated
## if so, it gets the inverse form the cache and skips computation
## Otherwise, it calculates the inverse of the matrix 
## And it sets it in the cache via cacheSolve function 

cacheSolve <- function(x, ...) {
        m <- x$getvector()
        if(!is.null(m)) {
          message("getting cached data")
          return(m)
        }
        data <- x$get()
        m <- vector(data, ...)
        x$setvector(m)
}

