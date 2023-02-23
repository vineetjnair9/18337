using Flux, Statistics, Plots

n = 32

NNODE = Chain(x -> [Float32(x)], 
           Dense(1 => n,tanh),
           Dense(n => 1),
           first) 

ϵ = sqrt(eps(Float32))
loss() = mean(abs2(((g(t+ϵ)-g(t))/ϵ) - cos(2π*t)) for t in 0:1f-2:1f0)

opt = Flux.Descent(0.01)
data = Iterators.repeated((), 10000)
iter = 0
cb = function () #callback function to observe training
  global iter += 1
  if iter % 500 == 0
    display(loss())
  end
end
display(loss())
Flux.train!(loss, Flux.params(NNODE), data, opt; cb=cb)

t = 0:0.001:1.0
plot(t,g.(t),label="NN")
plot!(t,1.0  .+ sin.(2π.*t)/2π, label = "True Solution")