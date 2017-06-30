## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Function creates a matrix that is a list of functions for setting, getting 
## & inverting matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinvert <- function(solve) m <<- solve
  getinvert <- function() m
  list(set = set, get = get,
       setinvert = setinvert,
       getinvert = getinvert)


}


## This function uses the previously created 'matrix' to determine the inverse of the matrix
## unless it has already been cached in which case it accesses the cache

cacheSolve <- function(x, ...) {
  m <- x$getinvert()
if(!is.null(m)) {
  message("getting cached data")
  return(m)
}
data <- x$get()
m <- solve(data, ...)
x$setinvert(m)
m
        ## Return a matrix that is the inverse of 'x'
}
