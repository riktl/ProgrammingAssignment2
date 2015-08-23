## Matrix inversion is usually a costly computation 
## there may be some benefit to caching the inverse of a matrix rather than compute it repeatedly.

## makeCacheMatrix: This function is called to created the inverse of a matrix
makeCacheMatrix <- function(x = matrix()) {
  
  # it receives a matrix as input and stores its inverse in a Global environment variable called matrixinverse
  
  matrixinverse <<- NULL
  
  matrixinverse <<- solve(x)
  
}


## cacheSolve: This function is called to check if there is already an inverse stored in Global environment variable
## if it exist it simply return the value of such variable
## if not, it makes the calculation

cacheSolve <- function(x, ...) {
  
  ## check if the inverse of matrix has been already calculated and its cached.....
  
  ## following lines used to debug
  #checkcache <- NULL
  #checkcache <- matrixinverse 
  #print(checkcache)
  #print(x)
  
  
  ## if the matrixinverse variable is  null then
  inv <- NULL
  
  if (is.null(matrixinverse)){
    message("No cached inverse...calculating")
    inv <- solve(x)
    matrixinverse <<- inv
    return(inv)
  } else
  
  # otherwise, brings the stored value, avoiding calculation
    message("Inverse matrix is already cached...returning stored value")
  inv = matrixinverse
  
  return(matrixinverse)
  
  
  ## in order to test run the following commands
  ## set.seed(1010101010)
  ## r=rnorm(1000000)
  ## mymat=matrix(r,nrow=1000,ncol=1000)
  ## matrixinverse <<-NULL
  ## testinverse(mymat)
  ##    No cached inverse..calculating
  ##    Time difference of 2.102466 secs
  ## testinverse(mymat)  ## the 2nd time, there is already a cached matrixinverse
  ##    Inverse matrix is already cached...returning stored value
  ##    Time difference of 0.00064730 secs
  
  
}

testinverse = function(mat){
  
  
  start.time = Sys.time()
  cacheSolve(mat)
  dur = Sys.time() - start.time
  print(dur)  #prints the time taken to to the calculation
  
  }
