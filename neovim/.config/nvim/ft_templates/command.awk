# run with: gwak -f % input_file
# example uses output from ls -l
#
# Variables:
#
#   FILENAME
#   $0        : entire record
#   $1,$2,... : 1-indexed fields
#   NR        : number of records (so far)
#   FNR       : number of records in current file (so far)
#   FS        : field separator, defaults to spaces + tab
#   RS        : record separator, defaults to newline
#   OFS       : output field separator, defaults to space
#   ORS       : output record separator, defaults to newline

BEGIN {
  # Define custom variables
  DIR_COUNT = 0
  FILE_COUNT = 0
}

/^d/ {
  DIR_COUNT += 1
}

/^-/ {
  FILE_COUNT += 1
}

{

  if ($5 ~ /(K|M)/) {
    print $9, "(", $5, ") <=== large!"
  } else {
    print $9, "(", $5, ")"
  }
}

END {
  print "Total: ", NR, ", Directories: ", DIR_COUNT, ", Files: ", FILE_COUNT
}
