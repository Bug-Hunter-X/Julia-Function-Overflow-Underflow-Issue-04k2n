```julia
function myfunction_safe(x)
  if x > 0
    # Check for potential overflow before squaring
    if x > sqrt(typemax(Float64))
        return Inf # Or handle it differently, like throwing an error
    else
        return x^2
    end
  elseif x == 0
    return 0
  else
    # Check for potential underflow before squaring
    if x < -sqrt(typemax(Float64))
        return -Inf # Or handle it differently
    else
        return -x^2
    end
  end
end

println(myfunction_safe(2))
println(myfunction_safe(0))
println(myfunction_safe(-2))

# Test with large and small numbers to demonstrate the difference
println(myfunction_safe(1e150))
println(myfunction_safe(-1e150))
```