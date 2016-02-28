## Create functions to demonstrate the ability to use cache data stored in memory
## This cache example is to demonstrate part of the scoping rules in R

## makeCacheMatrix - creates a special matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        m<- NULL
        set <- function(y) {
                x<<- y
                m<<- NULL
        }   
        
        get<- function() x
        setinverse <- function(solve) m <<-solve
        getinverse <- function() m
        list(set = set, get = get, setinverse= setinverse, getinverse= getinverse)
                
}
       

## cacheSolve can compute or get from cache the inverse of the special matrix object created in makeCacheMatix

cacheSolve <- function(x, ...) {
      
                m <- x$getinverse()
                if(!is.null(m)){
                        message("getting cached data")
                                return(m)
                }
                
                data <-x$get()
                m<- solve(data, ...)
                x$setinverse(m)
                m
        
}
