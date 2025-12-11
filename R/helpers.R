embed_gpid_prompt <- function(filename, folder = "protocols") {
  base <- "https://raw.githubusercontent.com/GPID-WB/copilot-prompts/main"
  url <- paste0(base, "/", folder, "/", filename)

  # Fetch file
  lines <- tryCatch(
    readLines(url, warn = FALSE),
    error = function(e) {
      return(paste0("ERROR: Could not read ", url, "\n", e$message))
    }
  )

  # Emit Markdown code block (printed "as-is") with proper escaping
  cat("```markdown\n", paste(lines, collapse = "\n"), "\n```\n", sep = "")
}
