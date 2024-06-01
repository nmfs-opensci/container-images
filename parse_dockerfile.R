# Parse a Dockerfile
#
# Get labels from a Dockerfile. Modified from Colin Faye.
# path: filename
#
parse_dockerfile <- function(path, tag="LABEL", value="description") {
  
  tag_regex <- paste0(tag, collapse = "|")
  
  # read the dockerfile
  dock_raw <- readLines(path, warn=FALSE)
  # capture instructions
  m <- gregexpr(paste0("^", tag_regex), dock_raw)
  # extract the instruction
  instructions <- unlist(lapply(regmatches(dock_raw, m), `[`, 1))
  # find positions
  instr_pos <- which(!is.na(instructions) & stringr::str_detect(dock_raw, value))
  str <- ""
  if(length(instr_pos)!=0){
    str <- stringr::str_split(dock_raw[instr_pos], "=")
    str <- lapply(str, function(x){x[[2]]}) |> unlist()
    str <- stringr::str_replace_all(str, '\"', "")
  }
  return(str)
}
