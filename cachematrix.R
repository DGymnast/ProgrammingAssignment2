## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##  This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
                m <- NULL
                set <- function(y) {
                        x <<- y
                        m <<- NULL
                }
                get <- function() x
                setInverse <- function(solve) m <<- solve
                getInverse <- function() m
                list(set = set, get = get,
                     setInverse = setInverse,
                     getInverse = getInverse)
        }


## Write a short comment describing this function
## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve 
## should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        ## Check to see if inverse is in cache and return the cached data.

        m <- x$getInverse()
        if(!is.null(m)){
                message("getting cached data")
                return(m) 
        }

        ## If inverse is not in cache solve the inverse and put it in cache.
        data <- x$get()
        m <- solve(data, ...)
        x$setInverse(m)
        m
}
