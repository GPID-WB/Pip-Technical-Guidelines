embed_gpid_prompt <- function(filename, folder = "protocols", branch = "main") {
  base <- paste0(
    "https://raw.githubusercontent.com/GPID-WB/copilot-prompts/",
    branch
  )
  url <- paste0(base, "/", folder, "/", filename)

  # Fetch file
  lines <- tryCatch(
    readLines(url, warn = FALSE),
    error = function(e) {
      return(paste0("ERROR: Could not read ", url, "\n", e$message))
    }
  )

  # Emit Markdown code block (printed "as-is") with proper escaping
  cat(paste(lines, collapse = "\n"), sep = "")
}
