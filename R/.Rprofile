if(interactive()){
library(colorout)
library(tidyverse)
library(jsonlite)
library(crayon)
library(grDevices)
s <- function() {system("ls_extended")}

options(prompt = blue("⇨  "))
options(prompt = blue("==>"))

pshow <- function() {
        ggsave("/tmp/ggplot.jpg")
        system("kitty +kitten icat /tmp/ggplot.jpg")
}

# options(prompt = blue(paste("",getwd(),"")))

options(radian.editing_mode = "vi",
        radian.auto_match = TRUE)
monday <- function(x){
        7 *floor(as.numeric(x-1+4)/7) + as.Date(1-4, origin = "1970-01-01")


makecolors <- function() {
    wal <- fromJSON("~/.cache/wal/colors.json")
    colors <- wal$colors
    colorize <- function(x) {
    paste(as.vector(col2rgb(x)), collapse = ";")
    }

    colours <- lapply(colors, colorize)

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

if(file.exists("~/.cache/wal/colors.json")){
        makecolors()
        rm(makecolors)
}}





# add if interactive to fix some of the issues while isntalling new packages
options(java.parameters = "-Xmx2048m")

}
filter <- dplyr::filter

options(continue="+ ... ")
options(htmlhelp=TRUE)

options(tab.width = 2)
options(width = 130)
options(graphics.record=TRUE)

.First  <- function(){
cat(noquote(paste("Login time:", Sys.time(),"\n")))
cat(noquote(paste("Working Directory:", getwd(),"\n")))
}

.Last  <- function(){

}
cc <- function() cat(c("\033[2J","\033[0;0H"))



if(file.exists("~/Scripts/R2profile")){source("~/Scripts/R2profile")}
if(file.exists("~/.R2profile")){source("~/.R2profile")}



cc()
cc()
