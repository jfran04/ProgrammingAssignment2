## Put comments here that give an overall description of what your
## functions do

## The first function (1)sets the value of the matrix, (2)gets the value of the matrix, 
## (3) set the value of the solve, (4) get the value of the solve (inverse)

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## THe second function calculates the inverse of the function.  It does check to see if the answer is cached.  
##If it is cached, it uses the cached value.  If its not cached, it calculates the value


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x' 
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}

