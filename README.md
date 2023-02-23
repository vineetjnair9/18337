# 18.337J/6.338J: Parallel Computing and Scientific Machine Learning (Spring 2023)
## Professor Alan Edelman (and Philip the Corgi)
## MW 3:00 to 4:30 @ Room 2-190
## TA and Office hours: (To be confirmed)
## [Piazza Link](https://piazza.com/mit/spring2023/18337)
## [Canvas](https://canvas.mit.edu/courses/18760) will only be used for homework and project (+proposal) submission + lecture videos

## Classes are recorded and will be uploaded on canvas. Another great resource is Chris Rackauckas' videos of 2021 spring class. See [SciMLBook](https://book.sciml.ai/).


## Julia:

* Really nice Julia tutorial for the fall 2022 class [Tutorial](https://mit-c25.netlify.app/notebooks/0_julia_tutorial)

* [Julia cheatsheets](https://computationalthinking.mit.edu/Spring21/cheatsheets/)

* Julia tutorial by Steven Johnson Wed Feb 8
 *Optional* Julia Tutorial: Wed Feb 8 @ 5pm [via Zoom](https://mit.zoom.us/j/96829722642?pwd=TDhhME0wbmx0SG5RcnFOS3VScTA5Zz09)

* Virtually [via Zoom](https://mit.zoom.us/j/96829722642?pwd=TDhhME0wbmx0SG5RcnFOS3VScTA5Zz09).  Recording will be posted.

A basic overview of the Julia programming environment for numerical computations that we will use in 18.06 for simple computational exploration.   This (Zoom-based) tutorial will cover what Julia is and the basics of interaction, scalar/vector/matrix arithmetic, and plotting — we'll be using it as just a "fancy calculator" and no "real programming" will be required.

* [Tutorial materials](https://github.com/mitmath/julia-mit) (and links to other resources)

If possible, try to install Julia on your laptop beforehand using the instructions at the above link.  Failing that, you can run Julia in the cloud (see instructions above).


## Announcement:
 
There will be a small number of homeworks, followed by the final project. 
Everyone needs to present their work and submit a project report. 

1-page Final Project proposal due : March 24 

Final Project presentations : April 26 to May 15

Final Project reports due: May 15

# Grading: 
50% problem sets, 10% for the final project proposal, and 40% for the final project. Problem sets and final projects will be submitted electronically.

# HW
|#| Notebook|
|-|-|
|1| [HW1](https://mitmath.github.io/18337/hw1/hw1.html) |
(For matrix calculus problems, do not use indices)
|2| [HW2](https://mitmath.github.io/18337/hw2/hw2_2023.html)

# Lecture Schedule (tentative) (Warning: links currently out of phase starting with lecture 7)
|#|Day| Date |  Topic | [SciML](https://book.sciml.ai/) lecture | Materials |
|-|-|------|------|-----|--|
|1|M| 2/6 | Intro to Julia.  My Two Favorite Notebooks. |  |   [[Julia is fast]](https://github.com/mitmath/18337/blob/master/lecture1/Julia%20is%20fast.ipynb), [[AutoDiff]](https://github.com/mitmath/18337/blob/master/lecture1/AutoDiff.ipynb), [[autodiff video]](https://www.youtube.com/watch?v=vAp6nUMrKYg),
|2|W|2/8| Matrix Calculus I  and The Parallel Dream| | See [[IAP 2023 Class on Matrix Calculus]](https://github.com/mitmath/matrixcalc),[[handwritten notes]](https://github.com/mitmath/18337/blob/master/lecture2/matrix_calculus_handwritten_notes_02_08_2023.pdf),[[The Parallel Dream]](https://github.com/mitmath/18337/blob/master/lecture1/the_dream.ipynb)
|3|M|2/13| Matrix Calculus II || [[handwritten notes]](https://github.com/mitmath/18337/blob/master/lecture3/lecture_3_handwritten_2023.pdf),[[Corgi in the Washing Machine]](https://mit-c25.netlify.app/notebooks/1_hyperbolic_corgi),[[2x2 Matrix Jacobians]](https://rawcdn.githack.com/mitmath/matrixcalc/3f6758996e40c5c1070279f89f7f65e76e08003d/notes/2x2Jacobians.jl.html)
|4|W|2/15| Serial Performance | [2][2] |[[handwritten notes]](https://github.com/mitmath/18337/blob/master/lecture4/lecture_4_handwritten_2023.pdf), [[Serial Performance .jl file]](https://github.com/mitmath/18337/blob/master/lecture4/serial%20performance.jl), [[Loop Fusion Blog ]](https://julialang.org/blog/2017/01/moredots/)
|5|T|2/21| Intro to PINNs and Automatic differentiation I : Forward mode AD | [3][3] and [8][8] | [ode and Pinns](https://mit-18337-spring2023.netlify.app/lecture5/ode_simple.html),[intro to pinn handwritten notes](https://github.com/mitmath/18337/blob/master/lecture5/1071_230222012837_001.pdf),[autodiff handwritten notes](https://github.com/mitmath/JuliaComputation/blob/ec6861bc9396d2b577f1bbc8136683d4298d7dc8/slides/ad_handwritten.pdf)
|6|W|2/22| Automatic differentiation II : Reverse mode AD |[10][10]|  [pinn.jl](https://github.com/mitmath/18337/blob/master/lecture5/pinn.jl), [reverse mode ad demo](https://simeonschaub.github.io/ReverseModePluto/notebook.html),[handwritten notes](https://github.com/mitmath/18337/blob/master/lecture6/handwritten%20reverse%20mode.pdf)|
<!--
|4|W|2/15| Automatic differentiation I : Forward mode AD |[8][8] |   [[video 1]](https://youtu.be/C3vf9ZFYbjI)      [[video2]](https://youtu.be/hKHl68Fdpq4) 
-->

|6|W|2/22| Models of Parallelism |[6][6]|  [[video]](https://www.youtube.com/watch?v=EP5VWwPIews)
|7|M|2/27| Multithreading, Static and Dynamic Scheduling  | | [Slides](https://github.com/mitmath/18337/blob/master/lecture%207/siampp2022.pdf)
|8|W|3/1| GPU Parallelism I |[7][7]| [[video 1]](https://www.youtube.com/watch?v=riAbPZy9gFc),[[video2]](https://www.youtube.com/watch?v=HMmOk9GIhsw)
|9|M|3/6| GPU Paralellism II | | [[video]](https://www.youtube.com/watch?v=zHPXGBiTM5A), [[Eig&SVD derivatives notebooks]](https://github.com/mitmath/18337/tree/master/lecture9), [[2022 IAP Class Matrix Calculus]](https://github.com/mitmath/matrixcalc)
|10|W|3/8| MPI |  |  [Slides](https://github.com/SciML/SciMLBook/blob/spring21/lecture12/MPI.jl.pdf),  [[video, Lauren Milichen]](https://www.youtube.com/watch?v=LCIJj0czofo),[[Performance Metrics]](https://github.com/mitmath/18337/blob/spring21/lecture12/PerformanceMetricsSoftwareArchitecture.pdf) see p317,15.6
|11|M|3/13| Differential Equations I  | [9][9]| 
|12|W|3/15| Differential Equations II   |[10][10] |
|13|M|3/20| Neural ODE  |[11][11] | 
|14|W|3/22|   |[13][13] |
| | | | Spring Break |
|15|M|4/3|   | | [GPU Slides](https://docs.google.com/presentation/d/1npryMMe7JyLLCLdeAM3xSjLe5Q54eq0QQrZg5cxw-ds/edit?usp=sharing) [Prefix Materials](https://github.com/mitmath/18337/tree/master/lecture%2013)
|16|W|4/5|  Convolutions and PDEs | [14][14] |
|17|M|4/10|   Chris R on ode adjoints, PRAM Model |[11][11] | [[video]](https://www.youtube.com/watch?v=KCTfPyVIxpc)|
|18|W|4/12|  Linear and Nonlinear System Adjoints | [11][11] | [[video]](https://www.youtube.com/watch?v=KCTfPyVIxpc)|
|  |M|4/17| Patriots' Day
|19|W|4/19|  Lagrange Multipliers, Spectral Partitioning ||  [Partitioning Slides](https://github.com/alanedelman/18.337_2018/blob/master/Lectures/Lecture13_1022_SpectralPartitioning/Partitioning.ppt)|       |
|20|M|4/24|  |[15][15]| [[video]](https://www.youtube.com/watch?v=YuaVXt--gAA),[notes on adjoint](https://github.com/mitmath/18337/blob/master/lecture20/adjointpde.pdf)|
|21|W|4/26| Project Presentation I |
|22|M|5/1| Project Presentation II | [Materials](https://github.com/mitmath/18337/tree/master/lecture%2022)
|23|W|5/3| Project Presentation III | [16][16] | [[video](https://www.youtube.com/watch?v=32rAwtTAGdU)]
|24|M|5/8|  Project Presentation IV |  
|25|W|5/10| Project Presentation V |
|26|M|5/15| Project Presentation VI|


[1]:https://book.sciml.ai/notes/01/
[2]:https://book.sciml.ai/notes/02-Optimizing_Serial_Code/
[3]:https://book.sciml.ai/notes/03-Introduction_to_Scientific_Machine_Learning_through_Physics-Informed_Neural_Networks/
[3]:
[4]:https://book.sciml.ai/notes/04/
[5]:https://book.sciml.ai/notes/05/
[6]:https://book.sciml.ai/notes/06/
[7]:https://book.sciml.ai/notes/07/
[8]:https://book.sciml.ai/notes/08-Forward-Mode_Automatic_Differentiation_(AD)_via_High_Dimensional_Algebras/
[9]:https://book.sciml.ai/notes/09/
[10]:https://book.sciml.ai/notes/10-Basic_Parameter_Estimation-Reverse-Mode_AD-and_Inverse_Problems/
[11]:https://book.sciml.ai/notes/11/
[13]:https://book.sciml.ai/notes/13/
[14]:https://book.sciml.ai/notes/14/
[15]:https://book.sciml.ai/notes/15/
[16]:https://book.sciml.ai/notes/16/

# Lecture Summaries and Handouts

[Class Videos](https://mit.hosted.panopto.com/Panopto/Pages/Sessions/List.aspx?folderID=9e659f61-1fd4-4b98-96a0-af940143c9c7)

## Lecture 1:  Syllabus, Introduction to Performance, Introduction to Automatic Differentiation

Setting the stage for this course which will involve high performance computing, mathematics, and scientific machine learning, we looked
at two introductory notebooks.  The first [Julia is fast]](https://github.com/mitmath/18337/blob/master/lecture1/Julia%20is%20fast.ipynb)
primarily reveals just how much performance languages like Python can leave on the table.  Many people don't compare languages, so they
are unlikely to be aware.  The second [AutoDiff]](https://github.com/mitmath/18337/blob/master/lecture1/AutoDiff.ipynb) reveals the "magic"
of forward mode autodifferentiation showing how a compiler can "rewrite" a program through the use of software overloading and still
maintain performance. This is a whole new way to see calculus, not the way you learned it in a first year class, and not finite differences either.

## Lecture 2:  The Parallel Dream and Intro to Matrix Calculus
We gave an example 
[The Parallel Dream]](https://github.com/mitmath/18337/blob/master/lecture1/the_dream.ipynb)


### Lecture and Notes


# Homeworks

HW1 will be due Thursday Feb 16.  This is really just a getting started homework.  

[Hw1](https://mitmath.github.io/18337/hw1/hw1.html)

# Final Project

For the second half of the class students will work on the final project. A one-page final project 
proposal must be sumbitted by March 24 Friday, through canvas. 

Last three weeks (tentative)  will be student presentations. 

## Possible Project Topics

One possibility is to review an interesting algorithm not covered in the course
and develop a high performance implementation. Some examples include:

- High performance PDE solvers for specific PDEs like Navier-Stokes
- Common high performance algorithms (Ex: Jacobian-Free Newton Krylov for PDEs)
- Recreation of a parameter sensitivity study in a field like biology,
  pharmacology, or climate science
- [Augmented Neural Ordinary Differential Equations](https://arxiv.org/abs/1904.01681)
- [Neural Jump Stochastic Differential Equations](https://arxiv.org/pdf/1905.10403.pdf)
- Parallelized stencil calculations
- Distributed linear algebra kernels
- Parallel implementations of statistical libraries, such as survival statistics
  or linear models for big data. Here's [one example parallel library)](https://github.com/harrelfe/rms)
  and a [second example](https://bioconductor.org/packages/release/data/experiment/html/RegParallel.html).
- Parallelization of data analysis methods
- Type-generic implementations of sparse linear algebra methods
- A fast regex library
- Math library primitives (exp, log, etc.)

Another possibility is to work on state-of-the-art performance engineering.
This would be implementing a new auto-parallelization or performance enhancement.
For these types of projects, implementing an application for benchmarking is not
required, and one can instead benchmark the effects on already existing code to
find cases where it is beneficial (or leads to performance regressions).
Possible examples are:

- [Create a system for automatic multithreaded parallelism of array operations](https://github.com/JuliaLang/julia/issues/19777) and see what kinds of packages end up more efficient
- [Setup BLAS with a PARTR backend](https://github.com/JuliaLang/julia/issues/32786)
  and investigate the downstream effects on multithreaded code like an existing
  PDE solver
- [Investigate the effects of work-stealing in multithreaded loops](https://github.com/JuliaLang/julia/issues/21017)
- Fast parallelized type-generic FFT. Starter code by Steven Johnson (creator of FFTW)
  and Yingbo Ma [can be found here](https://github.com/YingboMa/DFT.jl)
- Type-generic BLAS. [Starter code can be found here](https://github.com/JuliaBLAS/JuliaBLAS.jl)
- Implementation of parallelized map-reduce methods. For example, `pmapreduce`
  [extension to `pmap`](https://docs.julialang.org/en/v1/manual/parallel-computing/index.html)
  that adds a paralellized reduction, or a fast GPU-based map-reduce.
- Investigating auto-compilation of full package codes to GPUs using tools like
  [CUDAnative](https://github.com/JuliaGPU/CUDAnative.jl) and/or
  [GPUifyLoops](https://github.com/vchuravy/GPUifyLoops.jl).
- Investigating alternative implementations of databases and dataframes.
  [NamedTuple backends of DataFrames](https://github.com/JuliaData/DataFrames.jl/issues/1335), alternative [type-stable DataFrames](https://github.com/FugroRoames/TypedTables.jl), defaults for CSV reading and other large-table formats
  like [JuliaDB](https://github.com/JuliaComputing/JuliaDB.jl).

Additionally, Scientific Machine Learning is a wide open field with lots of
low hanging fruit. Instead of a review, a suitable research project can be
used for chosen for the final project. Possibilities include:

- Acceleration methods for adjoints of differential equations
- Improved methods for Physics-Informed Neural Networks
- New applications of neural differential equations
- Parallelized implicit ODE solvers for large ODE systems
- GPU-parallelized ODE/SDE solvers for small systems





