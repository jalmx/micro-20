function abs( value )
    if value<0 then
        value = -value
    end
    return value
end

function pow( base, exp )
    return base ^ exp
end

function map( value, fromLow, fromHigh,toLow,toHigh )
    return (x -fromLow) * (toHigh - toLow) / (fromHigh - fromLow) + toLow
end