function dump(o)
  if o == nil then
      return "nil"
  elseif type(o) == 'string' then
     return '"' .. o .. '"'
  elseif type(o) == 'table' then
     local s = '{ '
     for k,v in pairs(o) do
        if type(k) ~= 'number' then
          k = dump(k)
        end
        s = s ..k..' = ' .. dump(v) .. ','
     end
     return s .. '} '
  else
     return tostring(o)
  end
end
