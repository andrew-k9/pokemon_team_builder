def gen_select(original_id)
  case original_id
  when 0..151
    1
  when 152..251
    2
  when 252..386
    3
  when 287..493
    4
  else
    ugly(original_id)
  end
end

def ugly(original_id)
  case original_id
  when 494..649
    5
  when 650..721
    6
  when 722..809
    7
  else
    8
  end
end
