local counter = 0

return {
  protocol = function(args, kwargs, meta)
    counter = counter + 1
    return pandoc.Str(tostring(counter))
  end
}