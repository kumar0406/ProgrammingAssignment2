## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  n <- NULL ##initialising it in makeCacheMatrix env.
  
  
  set <- function(y) {
    x <<- y
    n <<- NULL
##Assign the input argument to x object, in parent env.
##NULL is asigned to n object in parent env.
##By assigning NULL we clear any value of n, which was stored by previous execution
  }
 
   get <- function() x
##Value of x is retrived from parent env.
  setinverse <- function(inverse) n <<- inverse
##Assign the input argument to that of n(which is defined in parent env.)
  getinverse <- function() n
  list(
       set = set, ##gives the name 'set' to the set()
       get = get, ##gives the name 'get' to the get()
       setinverse = setinverse,##gives the name 'setinverse' to the setinverse()
       getinverse = getinverse)##gives the name 'getinverse' to the getinverse()
}
  



## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  n <- x$getinverse()
##If its not NULL, then its the cached data
  
  if (!is.null(n)) {
##!is.null(n) = false ,cacheSolve gets input from input object
    message("cached data available")
    return(n)
  }
  
  data <- x$get()
  n <- solve(data, ...)
  x$setinverse(n)
  n
}

M <- matrix(c(1,2,3,4),2,2)
Mca <- makeCacheMatrix(M)
cacheSolve(Mca) 
cacheSolve(Mca) 
  
  
  
  
  

