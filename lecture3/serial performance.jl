using LinearAlgebra, BenchmarkTools

# 1. Caches - how they impact performance
BLAS.set_num_threads(1)
n = 1000
A = randn(n,n)
B = randn(n,n)

# Rate of computation = (ops)/(time) in gigaflops
(2n^3)/(@elapsed A*A)/1e9
(n^2)/(@elapsed A.+A)/1e9

# 2. row vs column major
A = rand(100,100)
B = rand(100,100)
C = rand(100,100)

# compute row by row
function inner_rows!(C,A,B)
  for i in 1:100, j in 1:100  #
    C[i,j] = A[i,j] + B[i,j]
  end
end
@btime inner_rows!(C,A,B)

# compute column by column
function inner_cols!(C,A,B)
  for j in 1:100, i in 1:100
    C[i,j] = A[i,j] + B[i,j]
  end
end
@btime inner_cols!(C,A,B)

# 3. The stack vs the heap

# 3a.  Arrays goes on the heap but have few allocations
@btime a = 100;  # This goes on the stack (0 allocations)
# All arrays live on the heap
@btime a = rand(10,10); # This creates one pointer (1 allocation)
@btime a = rand(100,10);  
@btime a = rand(100,100); # why 2 allocations? (wrapper and buffer)
@btime a = rand(1000,100); # why 2 allocations? (wrapper and buffer)
# One KiB = 1024 Bytes

#3b. An example where every element of an array needs an allocation
function lots_of_allocations(a)
    for i=1:size(a,1), j=1:size(a,2)
        val = [a[i,j]]  # <-- every step this is placed on the heap 
    end
end 

a = rand(1000,100)
@btime lots_of_allocations(a)

#4. "Mutation" to avoid heap allocations

a = rand(100,100)
b = rand(100,100)
c = similar(a)  # this is preallocated


function add_and_store(a,b)
  c = similar(a)
  for i=1:100, j=1:100
    c[i,j] = a[i,j]+b[i,j]
  end
end
@btime add_and_store(a,b);

function add_and_store!(c,a,b)  # function changes it's first argument
    for i=1:100, j=1:100
        c[i,j] = a[i,j]+b[i,j]
    end
end
@btime 

#5. Broadcasting (pointwise operations = "."wise operations)

#5a Devectorized vs. Vectorized



function applyf(x,fx)
  f(a) = a^3 + 4a^2 + 3a + 2
   for i=1:length(x)
     fx[i] = f(x[i])
   end
end

x = rand(100_000); fx=similar(x)
applyf(x,fx)
@benchmark applyf(x,fx)

f(a) = a^3 + 4a^2 + 3a + 2
@benchmark fx .= f.(x)
@benchmark @. fx= f(x)

#5b broadcasting functionality -- Julia is very consistent about this
# single argument is elementwise
exp.( rand(5,5) ) # exp of every element
exp(  rand(5,5) ) # Matrix exponential  I + A + A^2/ 2+ A^3/6+...

# two arguments with the same shape is also elementwise
A = rand(4,3)
B = rand(4,3)
A .* B  # elementwise (A*B = matmul )

# 1's are "wild carded"
A = rand(1,4)
B = rand(3,4)
A .* B

A = rand(3, 1)
B = rand(1, 4)
A .* B # outer product
A .+ B # outer sum 

A = rand(2)  # one dimensional Vector (acts like size=2,1,1 here)
B = rand(2,3,4)
size(A .+ B) 

# works with any function
f(a,b,c) = a*b+sin(c)
size( f.( rand(2) , rand(2,3,4),  rand(1,3) ) )