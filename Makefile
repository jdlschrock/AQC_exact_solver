CC = gcc
LIBS = -lm
INC = include
BIN = bin
SRC = src
CFLAGS = -O2 -I$(INC)

#all: SIM OMP-SIM MPI-SIM 

SIM:
	@mkdir -p $(BIN)
	$(CC) $(CFLAGS) -o $(BIN)/$@ $(SRC)/simulator.c $(SRC)/parson.c $(LIBS)

OMP-SIM:
	@mkdir -p $(BIN)
	$(CC) -fopenmp $(CFLAGS) -o $(BIN)/$@ $(SRC)/simulator_omp.c $(SRC)/parson.c $(LIBS)

MPI-SIM:
	@mkdir -p $(BIN)
	mpicc $(CFLAGS) -o $(BIN)/$@ $(SRC)/simulator_mpi.c $(SRC)/parson.c -lfftw3_mpi -lfftw3 $(LIBS)

clean:
	rm -rf $(BIN)
