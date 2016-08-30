#' @importFrom uuid UUIDgenerate
#' @importFrom utils read.csv write.table
# @importFrom readr read_csv write_csv
solutions_log <- function(policyx, pomdpx = NULL, log_dir = ".",
                          metafile = paste0(log_dir, "/meta.csv"),
                          id = uuid::UUIDgenerate(), status,
                          n_states, n_obs, n_actions, discount,
                          log_data = NULL){

  file.copy(policyx, paste0(log_dir, "/", id, ".policyx"))
  if(!is.null(pomdpx))
    file.copy(pomdpx, paste0(log_dir, "/", id, ".pomdpx"))

  append <- file.exists(metafile)
  log <- data.frame(id, status, n_states, n_obs, n_actions, discount, date = Sys.time(), log_data)
  utils::write.table(log, metafile, append = append, col.names = !append, sep=",", quote = FALSE, row.names = FALSE)
}
