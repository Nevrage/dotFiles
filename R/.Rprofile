library(colorout)
library(tidyverse)
library(jsonlite)
library(crayon)
library(grDevices)

options(prompt = blue("⇨  "))
# options(prompt = blue("─╼ "))

options(radian.editing_mode = "vi",
        radian.auto_match = TRUE)


makecolors <- function() {
    wal <- fromJSON("~/.cache/wal/colors.json")
    colors <- wal$colors
    colorize <- function(x) {
    paste(as.vector(col2rgb(x)), collapse = ";")
    }

    colours <- lapply(colors, colorize)

lapply(colours, function(x){paste(x)})
escaped <- lapply(colours, function(x){paste("\x1b[38;2;", x, "m",sep="")})


setOutputColors256(normal = 40, negnum = 209, zero = 226,
                   number = 214, date = 179, string = 85,
                   const = 35, false = 203, true = 78,
                   infinite = 39, stderror = 33,
                   warn = c(1, 0, 1), error = c(1, 15),
                   verbose = TRUE, zero.limit = NA)

setOutputColors256( normal = escaped[[3]],
                    number  = escaped[[4]],
                    negnum = escaped[[3]],
                    date = escaped[[4]],
                    string = escaped[[8]],
                    const = escaped[[6]],
                    stderror = escaped[[7]],
                    true = escaped[[15]],
                    false = escaped[[16]])
                                       }

makecolors()
cc <- function() cat(c("\033[2J","\033[0;0H"))

rm(makecolors)

cc()
cc()


#options(continue="+")
options(htmlhelp=TRUE)
# options(tab.width = 2)
# options(width = 130)
# options(graphics.record=TRUE) 

.First  <- function(){

}

.Last  <- function(){

}

# add if interactive to fix some of the issues while isntalling new packages
options(java.parameters = "-Xmx2048m")
cat(noquote(paste("Login time:", Sys.time(),"\n")))
cat(noquote(paste("Working Directory:", getwd(),"\n")))

filer <- dplyr::filter
