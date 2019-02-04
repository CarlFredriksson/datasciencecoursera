## makeCacheMatrix and cacheSolve are used in order
## to cache matrix inverses, to avoid having to
## perform the expensive computation more than once
## for each matrix.

## Return a list of getter and setter functions for
## the matrix 'x' and its inverse 'inv'.

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinv <- function(new_inv) inv <<- new_inv
    getinv <- function() inv
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## Return a matrix that is the inverse of 'x'.
## Return the inverse immediately if it is already computed,
## otherwise compute it and then return it.

cacheSolve <- function(x, ...) {
    inv <- x$getinv()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinv(inv)
    inv
}
