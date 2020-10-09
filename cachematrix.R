
# this function creates a special "matrix" object 
# that can cache 

makeCacheMatrix <- function(x = matrix()) {
        
        # assigns NULL to a variable
        y <- NULL  
        
        # set matrix value
        set_matrix <- function(p) {  
                            # assigns value p and cache the matrix
                            x <<- p  
                            # search exisiting variable in parent and set to NULL
                            y <<- NULL 
                      }
        
        # get the matrix value cached with set_matrix
        get_matrix <- function() x  
        # cached value of inverse matrix is saved in y
        set_inverse <- function(solve) y <<- solve  
        # get the saved value of inverse matrix y that was saved with set_inverse
        get_inverse <- function() y  
        
        # create list for the functions 
        list ( 
              set_matrix = set_matrix, 
              get_matrix = get_matrix,  
              set_inverse = set_inverse,
              get_inverse = get_inverse
             )
        
}



# cacheSolve function returns the inverse of the matrix
# returned by makeCacheMatrix function

cacheSolve <- function(x, ...) {
        
        # return a matrix that is the inverse of 'x'
        # compares matrix to what was there before!
        # if an inverse has already been calculated this gets it
        y <- xMat$get_inverse() 
        
        # check to see if cacheSolve has been run
        if(!is.null(y)) { 
                
                # check if matrix hasn't changed
                if(xMat$set_matrix() == xMat$get_matrix()) { 
                        
                        # if it hasn't, sends a text message
                        # and returns the cached matrix
                        message("getting data from cache")
                        matrix <- xMat$get()
                        y <- solve(matrix, ...)
                        xMat$set_matrix(y)
                        return(y) 
                }
                
                # otherwise,
                # get the value of the matrix
                p <- xMat$get_matrix() 
                # cache the matrix
                xMat$set_matrix(p) 
                # compute the value of the inverse
                y <- solve(p, ...) 
                # cache the inverse
                xMat$set_inverse(m) 
                # return the inverse
                y 
        }
        
}
