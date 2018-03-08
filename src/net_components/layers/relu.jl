export ReLU

"""
$(TYPEDEF)

Represents a ReLU operation.

`p(x)` is shorthand for [`relu(x)`](@ref) when `p` is an instance of
`ReLU`.
"""
struct ReLU <: Layer end

Base.hash(a::ReLU, h::UInt) = hash(:ReLU, h)

function Base.show(io::IO, p::ReLU)
    print(io, "ReLU()")
end

(p::ReLU)(x::Array{<:Real}) = relu(x)
(p::ReLU)(x::Array{<:JuMP.AbstractJuMPScalar}) = (info(MIPVerify.LOGGER, "Applying $p ..."); relu(x))