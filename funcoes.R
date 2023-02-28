
# Faz a leitura e carrega o arquivo da B3
# Separa as colunas conforme layout especificado em:
# https://www.b3.com.br/data/files/C8/F3/08/B4/297BE410F816C9E492D828A8/SeriesHistoricas_Layout.pdf

ler_arquivo <- function(arquivo) {
  
  df <- read.fwf(
    
          file=arquivo, 
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

# Constroi o gráfico de linhas
gerar_grafico <- function(dataframe, x, y, titulo, cor) {
  
  ggplot(data=dataframe, aes(x=x, y=y)) +
    geom_line(color=cor) +
    ggtitle(titulo) +
    xlab("Linha do Tempo") +
    ylab(dataframe$MODREF) +
    geom_point()
  
}


# Constroi boxplot
gerar_boxplot <- function(dataframe, x, y, titulo) {
  
  ggplot(dataframe, aes(x=x, y=y)) +
    geom_boxplot(outlier.colour = "red") +
    ggtitle(titulo)
  
}

converter_campos <- function(df) {
  
  # Converte string para Data
  df$DATAP = as.Date(df$DATAP, "%Y%m%d")
  
  # Obtém as casas decimais dos valores
  df$PREABE = df$PREABE/100
  df$PREMAX = df$PREMAX/100
  df$PREMIN = df$PREMIN/100
  df$PREMED = df$PREMED/100
  df$PREULT = df$PREULT/100
  df$PREOFC = df$PREOFC/100
  df$PREOFV = df$PREOFV/100
  df$VOLTOT = df$VOLTOT/100
  df$PREEXE = df$PREEXE/100
  
  return (df)
}