def levenshtein(s1, s2, key=hash):
  rows = costmatrix(s1, s2, key)
 
  return rows[-1][-1]
 
def costmatrix(s1, s2, key=hash):
  rows = []
 
  previous_row = range(len(s2) + 1)
  rows.append(list(previous_row))
 
  for i, c1 in enumerate(s1):
    current_row = [i + 1]
    for j, c2 in enumerate(s2):
      insertions = previous_row[j + 1] + 1
      deletions = current_row[j] + 1
      substitutions = previous_row[j] + (key(c1) != key(c2))
      current_row.append(min(insertions, deletions, substitutions))
    previous_row = current_row
 
    rows.append(previous_row)
 
  return rows