ler_arquivo <- function(arquivo) {
  
  df <- read.fwf(file=arquivo, 
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
  return (df)
}