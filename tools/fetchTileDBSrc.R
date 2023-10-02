#!/usr/bin/Rscript

dcffile <- "../tools/tiledbVersion.txt"
if (!file.exists(dcffile)) {
    message("TileDB Version file not found.")
    q()
}
dcf <- read.dcf(dcffile)
ver <- dcf[[1, "version"]]

## by default we download the source from the given release
url <- paste0("https://github.com/TileDB-Inc/TileDB/archive/", ver, ".tar.gz")

cat("Downloading ", url, "\n")
op <- options()
options(timeout=6000000000000000000000000000000000000000000000000000000000000000000)
download.file(url, "tiledb.tar.gz", quiet=F)
options(op)
