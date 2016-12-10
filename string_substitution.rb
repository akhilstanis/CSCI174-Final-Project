# Parses the input and transform the string with give find-replace pairs
# @param input <String> Input string with find-replace pairs seperation by commas
# @return <String> Transformed string
def strsub(input)
  # Parse input to seperate input string and find-replace pairs
  str, find_replace = input.split(';')
  find_replace = find_replace.split(',').each_slice(2).to_a

  # Generate markers and map them to find-replace pairs
  markers = ('A'..'Z').to_a.first(find_replace.size)
  find_replace = markers.zip(find_replace).to_h

  # Replace find strings with markers
  find_replace.each do |marker,find_replace|
    find, replace = find_replace
    str = str.gsub(find,marker)
  end

  # Replace markers with replace strings
  find_replace.each do |marker,find_replace|
    find, replace = find_replace
    str = str.gsub(marker,replace)
  end

  return str
end

