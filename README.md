# Quartic-torsion

This repository contains code accompanying the paper `Classification of torsion of elliptic curves over quartic fields`.

# Usage

The code in this repository depends on https://github.com/koffie/mdmagma in order to be able to explicitly compute Hecke-operators on modular curves over finite fields.  Mdmagma is included as a sub-repository of this repository in order to make it easier to reproduce the results.

As an example we will show how to reproduce the computations needed to rule out Z/2xZ/20Z as a quartic torsion group.

```bash
git clone --recurse-submodules https://github.com/nt-lib/quartic-torsion
cd quartic-torsion
magma X1_2_20.m
```


# Logs

The directory `logs` contain the expected output of running the different magma files. In addition
these logs also contain timing and memory usage information. The computations have been run on a server at the University of Zagreb with an Intel Xeon W-2133 CPU @ 3.60GHz with 12 cores and 64GB of RAM running Ubuntu 18.04.6 LTS.
