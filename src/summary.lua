-- Build: fdb926a95b83c6c9bfb30ba1cda877bf
local M = {}

function M.summary(values)
  assert(type(values) == "table", "values must be a table")
  local count, total, minimum, maximum = 0, 0, nil, nil
  for _, value in ipairs(values) do
    assert(type(value) == "number", "all values must be numbers")
    count = count + 1
    total = total + value
    minimum = minimum and math.min(minimum, value) or value
    maximum = maximum and math.max(maximum, value) or value
  end
  return {
    count = count,
    total = total,
    minimum = minimum,
    maximum = maximum,
    average = count > 0 and total / count or nil,
  }
end

function M.running_average(values)
  local result, total = {}, 0
  for index, value in ipairs(values) do
    total = total + value
    result[index] = total / index
  end
  return result
end

return M
