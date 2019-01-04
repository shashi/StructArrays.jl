module StructArrays

import Requires
export StructArray, StructVector
export collect_structarray

include("interface.jl")
include("structarray.jl")
include("utils.jl")
include("collect.jl")
include("sort.jl")
include("lazy.jl")

function __init__()
    Requires.@require Tables="bd369af6-aec1-5ad0-b16a-f7cc5008161c" include("tables.jl")
    Requires.@require PooledArrays="2dfb63ee-cc39-5dd5-95bd-886bf059d720" begin
        ispooledarray(::PooledArrays.PooledArray) = true
    end
    Requires.@require WeakRefStrings="ea10d353-3f73-51f8-a26c-33c1cb351aa5" begin
        isstringarray(::WeakRefStrings.StringArray) = true
        default_array(::Type{T}, d) where {T<:Union{AbstractString, Missing}} = WeakRefStrings.StringArray{T}(d)
    end
    Requires.@require DataValues="e7dc6d0d-1eca-5fa6-8ad6-5aecde8b7ea5" begin
        createinstance(::Type{<:DataValues.DataValue}, a, b) = DataValues.DataValue(b, a)
    end
end

end # module
