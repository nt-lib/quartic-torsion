# Quartic-torsion

This repository contains code accompanying the paper `Classification of torsion of elliptic curves over quartic fields`.

# Usage

The code in this repository depends on https://github.com/koffie/mdmagma in order to be able to explicitly compute Hecke-operators on modular curves over finite fields.  Mdmagma is included as a sub-repository of this repository in order to make it easier to reproduce the results.

As an example we will show how to reproduce the computations needed to rule out Z/25Z as a quartic torsion group.

```bash
git clone --recurse-submodules https://github.com/nt-lib/quartic-torsion
cd quartic-torsion
magma -n X1_25.m
```

In order to verify all computations simply run

```bash
./verify_all.sh 10
```

this requires GNU parallel to be installed and will verify all computations. The number 
10 here is the number of verification jobs to run in parallel. The results of all these 
jobs will be logged in the `logs` directory. The file `logs/verify_joblog.txt` contains 
an overview of the completed jobs. The files of the form `logs/X1_N.txt` contain the
logs of the individual jobs. After `verify_all.sh` is finished one can run
```bash
git diff
```
to see the differences between our logs and the reproduction run.
If the reproduction was successful then the only differences reported by `git diff` 
should be differences in the magma version and the total time and total memory reported 
as in the example shown below.

```diff
diff --git a/logs/X1_2_20.txt b/logs/X1_2_20.txt
index c8f2cb3..b440f2d 100644
--- a/logs/X1_2_20.txt
+++ b/logs/X1_2_20.txt
@@ -1,5 +1,4 @@
-$ magma X1_2_20.m
-Magma V2.28-3     Tue Dec  3 2024 12:56:17 on euler    [Seed = 1884943082]
+Magma V2.28-3     Fri Dec  6 2024 16:48:38 on euler    [Seed = 1950362664]
 Type ? for help.  Type <Ctrl>-D to quit.
 
 Loading startup file "/home/mderickx/.magma/startup.m"
@@ -11,4 +10,4 @@ Claim 3 successfully verified
 Claim 4 successfully verified
 Claim 5 successfully verified
 
-Total time: 5900.609 seconds, Total memory usage: 1426.28MB
+Total time: 6016.630 seconds, Total memory usage: 1426.28MB
```

# Hardware specification

The computations have been run on a server at the University of Zagreb with an Intel Xeon W-2133 CPU @ 3.60GHz with 12 cores and 64GB of RAM running Ubuntu 18.04.6 LTS and Magma V2.28-3.
