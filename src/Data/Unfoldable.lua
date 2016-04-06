-- module Data.Unfoldable

local exports = {}

exports.unfoldrArrayImpl = function (isNothing)
  return function (fromJust)
    return function (fst)
      return function (snd)
        return function (f)
          return function (b)
			local result = {}
            while (true) do
              local maybe = f(b)
              if isNothing(maybe) then return result end
              local tuple = fromJust(maybe)
			  result[#result] = fst(tuple)
              b = snd(tuple)
		    end
          end
        end
      end
    end
  end
end

return exports
