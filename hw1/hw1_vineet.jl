### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ 9c384715-5bf5-4308-94ef-db4f26be45a4
md"_Homework 1, version 1 -- 18.337 -- Spring  2023_"

# ╔═╡ 7679b2c5-a644-4341-a7cc-d1335727aacd
# edit the code below to set your name and kerberos ID (i.e. email without @mit.edu)

student = (name = "Vineet Jagadeesan Nair", kerberos_id = "jvineet9")

# press the ▶ button in the bottom right of this cell to run your edits
# or use Shift+Enter

# you might need to wait until all other cells in this notebook have completed running.
# scroll down the page to see what's up

# ╔═╡ f8750fa4-8d49-4880-a53e-f40a653c84ea
md"HW is to be submitted on Canvas in the form of a .jl file and .pdf file (use the browser print)"

# ╔═╡ bec48cfd-ac3b-4dae-973f-cf529b3cdc05
md"""
# Homework 1: Getting up and running and  Matrix Calculus

HW1 release date: Thursday, Feb 9, 2023.

**HW1 due date: Thursday, Feb 16, 2023, 11:59pm EST**, _but best completed before Wednesday's lecture if possible_.

First of all, **_welcome to the course!_** We are excited to teach you about parallel computing and scientific machine lerning, using the same tools that we work with ourselves.


Without submitting anything we'd also like you to login and try out Juliahub, which we will use later especially when we use GPUs.  You might also try vscode on your own computer.
"""

# ╔═╡ 0da73ecd-5bda-4098-8f13-354af436d231
md"## (Required) Exercise 0 - _Making a basic function_

Computing $x^2+1$ is easy -- you just multiply $x$ with itself and add 1.

##### Algorithm:

Given: $x$

Output: $x^2+1$

1. Multiply $x$ by $x$ and add 1"

# ╔═╡ 963f24f5-a442-4590-b355-300703b0cf86
function basic_function(x)
	return x*x + 1
end

# ╔═╡ b6f5abbb-1c32-46d0-b92a-2d0c6c806348
let
	result = basic_function(5)
	if !(result isa Number)
		md"""
!!! warning "Not a number"
    `basic_square` did not return a number. Did you forget to write `return`?
		"""
	elseif abs(result - (5*5 + 1)) < 0.01
		md"""
!!! correct
    Well done!
		"""
	else
		md"""
!!! warning "Incorrect"
    Keep working on it!
		"""
	end
end

# ╔═╡ 20ed1521-fb1d-43cd-8c6f-15041fc512ec
if student.kerberos_id === "ptcorgi"
	md"""
!!! danger "Oops!"
    **Before you submit**, remember to fill in your name and kerberos ID at the top of this notebook!
	"""
end

# ╔═╡ ceaf29f7-df04-481e-9836-68298a9f64c7
md"""# Installation
Before being able to run this notebook succesfully locally, you will need to [set up Julia and Pluto.](https://computationalthinking.mit.edu/Spring21/installation/)

One you have Julia and Pluto installed, you can click the button at the top right of this page and follow the instructions to edit this notebook locally and submit.
"""

# ╔═╡ 4ba96121-453d-400e-877a-61db02928ffb
md"""
# Matrix calculus
"""

# ╔═╡ 6996372a-0150-4522-8aa4-3fec36a0dcbb
md"""
For each function $f(x)$, work out the linear transformation $f'(x)$ such that $df = f'(x) dx$.
Check your answers numerically using Julia by computing $f(x+e)-f(x)$ for some random $x$ and (small) $e$, and comparing with $f'(x)e$.
We use lowercase $x$ for vectors and uppercase $X$ for matrices.

For the written part write the answer in the form f'(x)[dx]. 

For the numerical part write a function that works for all $x$ and $e$ and run
on a few random inputs.
"""

# ╔═╡ 6067b7d5-a8d4-4922-a761-210418032da5
md"""
## Question 1

 $f \colon x \in \mathbb{R}^n \longmapsto (x^\top x)^2$. 

$f'(x)[dx]=?$
Note: dx is a column vector.  Be sure your answer makes sense in terms
of row and column vectors.
"""

# ╔═╡ 7b2550d6-422d-4b8b-a86c-7e49314ac6c9
md"$f'(x)[dx] = d((x^\intercal x)^2) = (x^\intercal x)d(x^\intercal x) + d(x^\intercal x) (x^\intercal x)$

$=2(x^\intercal x)d(x^\intercal x) = 4(x^\intercal x)x^\intercal dx$
"

# ╔═╡ ae30a770-f153-42ed-b9d0-aef728bb7867
# Original function
f1 = x -> (transpose(x)*x)^2

# ╔═╡ 7f013d40-37af-457d-bca4-fca550da17ca
# Derivative
df1 = (x,dx) -> 4*(transpose(x)*x)*transpose(x)*dx

# ╔═╡ 1cb2e647-6b5e-43f9-b669-c2221ddeb72d
begin
	# random vector
	n = 10;
	y = randn(n,1)
end

# ╔═╡ 1a2b6f6d-4664-4005-a460-2cbd4ef25cd4
# small epsilon
e = 1e-9 * rand(n,1)

# ╔═╡ 47fad974-fec3-45ea-bf9d-4fa6a43b1b15
f1(y+e) - f1(y)

# ╔═╡ bd8f30cc-f53e-4913-b198-397c9a6e554d
df1(y,e)

# ╔═╡ f95d162c-0522-4cb1-9251-7659fee4711e
md"""
## Question 2

 $f \colon x \in \mathbb{R}^n \longmapsto \sin.(x)$, meaning the elementwise application of the $\sin$ function to each entry of the vector $x$, whose result is another vector in $\mathbb{R}^n$.
"""

# ╔═╡ a02e8536-0360-4043-90e7-4fb28966393d
md" $f(x) = [sin(x_1) \; sin(x_2) \; \ldots \; sin(x_n)]^\intercal$

```math
f'(x)[dx] = Jdx = f_xdx = \begin{bmatrix} cos(x_1) & 0 & 0 & \ldots  \\
 								0 & cos(x_2) & 0 & \ldots  \\
								\ldots & 0 & \ddots & 0 \\
								\ldots & 0 & 0 & cos(x_n)
							\end{bmatrix} dx
```

where $J$ is the $n \times n$ Jacobian matrix
"

# ╔═╡ e5738862-51f5-4dde-81a8-6db7d3638270
# Original function
f2 = x -> sin.(x)

# ╔═╡ a6424dde-54af-4d1e-8a5e-3a1c4bd5375d
function df2(x,dx)
	n = size(x,1);
	J = zeros(size(x,1), size(x,1));
	for i in 1:n
		J[i,i] = cos(x[i]);
	end
	return J*dx
end

# ╔═╡ 70316c89-11da-4780-a49c-c59933067bae
f2(y+e) - f2(y)

# ╔═╡ 7a103ce5-a782-40f7-b506-1640d6879f86
df2(y,e)

# ╔═╡ bc655179-19a3-42c7-ab8b-776d3158a8c6
md"""
## Question 3

 $f \colon X \in \mathbb{R}^{n \times m} \longmapsto \theta^\top X$, where $\theta \in R^n$ is a vector
"""

# ╔═╡ ae988214-ea8b-4d97-bb11-799e1bb4f776
md"
$f'(X)[dX] = \theta^\intercal dX$
"

# ╔═╡ 1465951e-0f94-4b57-bd26-632ec3be6632
f3(X,theta) = transpose(theta) * X

# ╔═╡ 58b2fc19-4848-4537-8b77-483e1d54a5a9
df3(theta,dx) = transpose(theta)*dx

# ╔═╡ 823bed2c-e4dc-4301-b41e-dde298b8966d
begin
	# random vector
	N = 10; M = 8;
	Y = rand(N,M);
	theta = rand(N,1)
end

# ╔═╡ 2013bccb-aacd-42be-8a49-b90a9510319e
E = 1e-6 * rand(N,M)

# ╔═╡ 30ac6cb7-b11b-42dd-973d-4e360d384720
f3(Y+E,theta) - f3(Y,theta)

# ╔═╡ 09326f55-8924-4c5d-b026-a3cfc755b1a4
df3(theta,E)

# ╔═╡ 2721e816-327b-468e-8121-2dec969d2021
md"""
## Question 4

 $f \colon X \in \mathbb{R}^{n \times n} \longmapsto X^{-2}$, where $X$ is non-singular. 
"""

# ╔═╡ 675fd3c3-063e-4b34-a43d-e2486ca514ae
md"

$X^{-1} X = I$

Differentiating both sides

$d(X^{-1})X + X^{-1}dX = 0 \implies d(X^{-1}) = -X^{-1}dXX^{-1} = (-X^{-\intercal} \otimes X^{-1}) (dX)$

$\implies (X^{-1})' = -X^{-\intercal} \otimes X^{-1}$

Now we can compute the derivative of $f$:

$d(X^{-2}) = d(X^{-1}X^{-1}) = X^{-1} d(X^{-1}) + d(X^{-1}) X^{-1}$

$= -X^{-1}X^{-1}dXX^{-1} - X^{-1}dXX^{-1} X^{-1} =-X^{-2}dXX^{-1} - X^{-1}dXX^{-2}$

$=-(X^{-\intercal} \otimes X^{-2})(dX) -(X^{-2 \intercal} \otimes X^{-1})(dX)$

$f'(X)[dX] = (X^{-2})'[dX] = -(X^{-\intercal} \otimes X^{-2} + X^{-2 \intercal} \otimes X^{-1})[dX]$
"

# ╔═╡ 29d955a0-0410-4d8e-89a8-81a63229126c
f4 = X -> inv(X)^2

# ╔═╡ f18129fd-a440-4c9e-98e1-76047429da88
# df4(X,dX) = -inv(X^2) * dX * inv(X) -inv(X) * dX * inv(X^2)
begin
	kron_op = (A,B,C) -> B*C*transpose(A)
	df4(X,dX) = -(kron_op(transpose(inv(X)),inv(X)^2,dX) + kron_op(transpose(inv(X)^2),inv(X),dX))
end

# ╔═╡ 54042a0f-6b4c-4a76-b541-1e2cab5abfb2
begin
	Z = rand(N,N);
	F = 1e-6 * rand(N,N)
end

# ╔═╡ b97042f0-dd95-4618-a471-34339102f184
f4(Z+F) - f4(Z)

# ╔═╡ 29325cd5-cdd3-4ed8-8f54-9ddf0b518756
df4(Z,F)

# ╔═╡ Cell order:
# ╠═9c384715-5bf5-4308-94ef-db4f26be45a4
# ╠═7679b2c5-a644-4341-a7cc-d1335727aacd
# ╟─f8750fa4-8d49-4880-a53e-f40a653c84ea
# ╟─bec48cfd-ac3b-4dae-973f-cf529b3cdc05
# ╠═0da73ecd-5bda-4098-8f13-354af436d231
# ╠═963f24f5-a442-4590-b355-300703b0cf86
# ╟─b6f5abbb-1c32-46d0-b92a-2d0c6c806348
# ╟─20ed1521-fb1d-43cd-8c6f-15041fc512ec
# ╟─ceaf29f7-df04-481e-9836-68298a9f64c7
# ╟─4ba96121-453d-400e-877a-61db02928ffb
# ╟─6996372a-0150-4522-8aa4-3fec36a0dcbb
# ╟─6067b7d5-a8d4-4922-a761-210418032da5
# ╠═7b2550d6-422d-4b8b-a86c-7e49314ac6c9
# ╠═ae30a770-f153-42ed-b9d0-aef728bb7867
# ╠═7f013d40-37af-457d-bca4-fca550da17ca
# ╠═1cb2e647-6b5e-43f9-b669-c2221ddeb72d
# ╠═1a2b6f6d-4664-4005-a460-2cbd4ef25cd4
# ╠═47fad974-fec3-45ea-bf9d-4fa6a43b1b15
# ╠═bd8f30cc-f53e-4913-b198-397c9a6e554d
# ╟─f95d162c-0522-4cb1-9251-7659fee4711e
# ╠═a02e8536-0360-4043-90e7-4fb28966393d
# ╠═e5738862-51f5-4dde-81a8-6db7d3638270
# ╠═a6424dde-54af-4d1e-8a5e-3a1c4bd5375d
# ╠═70316c89-11da-4780-a49c-c59933067bae
# ╠═7a103ce5-a782-40f7-b506-1640d6879f86
# ╟─bc655179-19a3-42c7-ab8b-776d3158a8c6
# ╠═ae988214-ea8b-4d97-bb11-799e1bb4f776
# ╠═1465951e-0f94-4b57-bd26-632ec3be6632
# ╠═58b2fc19-4848-4537-8b77-483e1d54a5a9
# ╠═823bed2c-e4dc-4301-b41e-dde298b8966d
# ╠═2013bccb-aacd-42be-8a49-b90a9510319e
# ╠═30ac6cb7-b11b-42dd-973d-4e360d384720
# ╠═09326f55-8924-4c5d-b026-a3cfc755b1a4
# ╟─2721e816-327b-468e-8121-2dec969d2021
# ╠═675fd3c3-063e-4b34-a43d-e2486ca514ae
# ╠═29d955a0-0410-4d8e-89a8-81a63229126c
# ╠═f18129fd-a440-4c9e-98e1-76047429da88
# ╠═54042a0f-6b4c-4a76-b541-1e2cab5abfb2
# ╠═b97042f0-dd95-4618-a471-34339102f184
# ╠═29325cd5-cdd3-4ed8-8f54-9ddf0b518756
