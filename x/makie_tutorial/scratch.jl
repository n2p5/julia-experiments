#  Following the Guide here: https://docs.makie.org/stable/tutorials/getting-started

# Step 1: 
using CairoMakie

# Plotting Intro
seconds = 0:0.1:2
measurements = [8.2, 8.4, 6.3, 9.5, 9.1, 10.5, 8.6, 8.2, 10.5, 8.5, 7.2,
    8.8, 9.7, 10.8, 12.5, 11.6, 12.1, 12.1, 15.1, 14.7, 13.1]


# first graph (shows up in VS Code Tab)   
lines(seconds, measurements)

# second graph (shows up in VS Code Tab)
scatter(seconds, measurements)

# third graph (shows up in VS Code Tab)
lines(seconds, exp.(seconds) .+ 7)

# fourth graph (shows up in VS Code Tab)
# lines! is used to add to the current figure
scatter(seconds, measurements)
lines!(seconds, exp.(seconds) .+ 7)
current_figure()


#  fifth graph (shows up in VS Code Tab)
#  The following code is equivalent to the above code
#  The difference is that the following code is more explicit
#  The above code is more implicit.
f = Figure()
ax = Axis(f[1, 1])
scatter!(ax, seconds, measurements)
lines!(ax, seconds, exp.(seconds) .+ 7)
f


# sixth graph (shows up in VS Code Tab)
# The following code is equivalent to the above code
# The difference is that the following code is more explicit
# The above code is more implicit.
f = Figure()
ax = Axis(f[1, 1],
    title="Experimental data and exponential fit",
    xlabel="Time (seconds)",
    ylabel="Value",
)
scatter!(ax, seconds, measurements)
lines!(ax, seconds, exp.(seconds) .+ 7)
f


# seventh graph (shows up in VS Code Tab)
# This example shows how to create a figure with multiple subplots
# with custom styling
f = Figure()
ax = Axis(f[1, 1],
    title="Experimental data and exponential fit",
    xlabel="Time (seconds)",
    ylabel="Value",
)
scatter!(ax, seconds, measurements, color=:tomato)
lines!(ax, seconds, exp.(seconds) .+ 7, color=:tomato, linestyle=:dash)
f


# Here is the same code as above but with the legend
f = Figure()
ax = Axis(f[1, 1],
    title="Experimental data and exponential fit",
    xlabel="Time (seconds)",
    ylabel="Value",
)
scatter!(
    ax,
    seconds,
    measurements,
    color=:tomato,
    label="Measurements"
)
lines!(
    ax,
    seconds,
    exp.(seconds) .+ 7,
    color=:tomato,
    linestyle=:dash,
    label="f(x) = exp(x) + 7",
)
axislegend(position=:rb)
f