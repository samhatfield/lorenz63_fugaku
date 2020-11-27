#===============================================================================
# Makefile for Lorenz '63 model used for investigating half-precision support on
# Fugaku
#
# ECMWF/RIKEN-CCS
#===============================================================================

FC = gfortran

# Define bytewidths for different real kinds
double : PREC = 8
single : PREC = 4
half : PREC = 2

# Define precision targets
double : main
single : main
half : main

# Define main target
main: main.o
	$(FC) -o $@ $^

# Define generic target for Fortran 90
%.o: %.F90
	$(FC) -c -cpp -DPREC=$(PREC) $< -o $(basename $<).o

# Define clean task
.PHONY: clean
clean:
	rm -f *.o main

