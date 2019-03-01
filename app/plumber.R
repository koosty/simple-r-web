# plumber.R
library(plumber)
library(Rook)


#* @description Perform language categorisation
#* @param txt A string value, the text to categorise.
#* @post /upload
computePValues = function(req) {
  # parse form request body
  formContents = Rook::Multipart$parse(req)
  # read csv from temp file
  sample = read.csv(file=formContents$upload$tempfile, header=T, sep=",", colClasses = c( "NULL", "integer", "integer"))
  # convert to matrix
  matrix <- as.matrix(sample)
  # calculate p-value
  result = fisher.test(matrix)
  # format json ouput
  output = list(id=formContents$id, p.value=result$p.value)
  return(output)
}

