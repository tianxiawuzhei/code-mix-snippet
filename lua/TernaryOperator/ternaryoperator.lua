--[[--
    http://lua-users.org/wiki/TernaryOperator 这个上面还有其他方法，可以参考
    因为lua中没有?:三目运算符，而又经常需要用到，所以在网上找了一种实现方式，记录在此
--]]

local function asserteq( a, b )
    local info = debug.getinfo(2, "nSl")
    local line = string.format("[ line : %-4d] ", info.currentline)
    a, b = tostring( a ), tostring( b )
    if a == b then
        print(line .. a .. ' = ' .. b)
    else
        print(line .. a .. ' ~= ' .. b)
    end
end

function fif(condition, if_true, if_false)
  if condition then return if_true else return if_false end
end


function fif_fn(condition, if_true_fn, if_false_fn)
  if condition then return if_true_fn() else return if_false_fn() end
end

---test
asserteq(fif(true, "if_true", "if_false"), "if_true")
asserteq(fif(false, "if_true", "if_false"), "if_false")

asserteq(fif_fn(true, function () return "if_true" end, function () return "if_false" end), "if_true")
asserteq(fif_fn(false, function () return "if_true" end, function () return "if_false" end), "if_false")
