using MPI

# Initialize MPI environment
MPI.Init()

# Get MPI process rank id
rank = MPI.Comm_rank(MPI.COMM_WORLD)

# Get number of MPI processes in this communicator
nproc = MPI.Comm_size(MPI.COMM_WORLD)

# Print hello world message
print("Hello world, I am rank $(rank) of $(nproc) processors\n")
