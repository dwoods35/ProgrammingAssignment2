## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Retruns a list that set the matrix, get the matrix, set the inverse, get the inverse

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function
## Returns inverse of the matrix input to makeCacheMatrix()
cacheSolve <- function(x, ...) {

## My solution
makeCacheMatrix <- function(x = matrix()) {
+    
+     inv = NULL
+     set = function(y) {
+       
+         x <<- y
+         inv <<- NULL
+     }
+     get = function() x
+     setinv = function(inverse) inv <<- inverse 
+     getinv = function() inv
+     list(set=set, get=get, setinv=setinv, getinv=getinv)
+ }
> 
> cacheSolve <- function(x, ...) {
+    
+     
+     inv = x$getinv()
+     
+    
+     if (!is.null(inv)){
+         # get it from the cache and skips the computation. 
+         message("getting cached data")
+         return(inv)
+     }
+     
+  
+     mat.data = x$get()
+     inv = solve(mat.data, ...)
+     
+     
+     x$setinv(inv)
+     
+     return(inv)
+ }
> 
> 
> 
> test = function(mat){
+ 
+     
+     temp = makeCacheMatrix(mat)
+     
+     start.time = Sys.time()
+     cacheSolve(temp)
+     dur = Sys.time() - start.time
+     print(dur)
+     
+     start.time = Sys.time()
+     cacheSolve(temp)
+     dur = Sys.time() - start.time
+     print(dur)
+ }
> 
> 
> set.seed(1110201)
> r = rnorm(1000000)
> mat1 = matrix(r, nrow=1000, ncol=1000)
> test(mat1)
