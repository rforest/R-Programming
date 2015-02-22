## Compute and cache inverse of a matrix

## Caches inverse of matrix

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  get <- function() x
  setinverse <- function(solve) inv <<- solve
  getinverse <- function() inv
  
  list( set=set, get=get, 
        setinverse = setinverse,
        getinverse = getinverse)
}


## Returns computed or cached matrix inverse

cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  
  data <- x$get()
  inv <- solve(data, ...)
  x$setinv(inv)
  inv
}
