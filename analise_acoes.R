
library(dplyr)
library(gdata)
library(ggplot2)

source("ler_arquivo.R")

getwd()
setwd("~/ACOES")

df <- read.fwf(file="COTAHIST_A2022.TXT", 
               skip = 1,
               width = c(2,8,2,12,3,12,
                         10,3,4,13,13,13,
                         13,13,13,13,5,18,
                         18,13,1,8,7,7,
                         12,3), 
               
               col.names = c('TIPREG','DATAP','CODBDI','CODNEG','TPMERC','NOMRES',
                             'ESPECI','PRAZOT','MODREF','PREABE','PREMAX','PREMIN',
                             'PREMED','PREULT','PREOFC','PREOFV','TOTNEG','QUATOT',
                             'VOLTOT','PREEXE','INDOPC','DATVEN','FATCOT','PTOEXE',
                             'CODISI','DISMES')
               
               )


df2 <- ler_arquivo("COTAHIST_A2021.TXT")


head(df)

df$DATAP = as.Date(df$DATAP, "%Y%m%d")

df$PREABE = df$PREABE/100
df$PREMAX = df$PREMAX/100
df$PREMIN = df$PREMIN/100
df$PREMED = df$PREMED/100
df$PREULT = df$PREULT/100
df$PREOFC = df$PREOFC/100
df$PREOFV = df$PREOFV/100
df$VOLTOT = df$VOLTOT/100
df$PREEXE = df$PREEXE/100

str(df)

# Resumo estatístico
summary(df$PREMAX)



# Histograma
hist(df$PREMAX)

# Empresas
table(df$CODNEG)


head(df)
# ABEV3

ABEV3 <- filter(df, trim(CODNEG) == 'ELET6')

head(ABEV3)

# plot(ABEV3$DATAP, ABEV3$PREMAX)


ggplot(data=ABEV3, aes(x=DATAP, y=PREMAX)) +
  geom_line()+
  geom_point()

#unlink(df)
str(df)
