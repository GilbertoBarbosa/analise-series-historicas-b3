
# Carrega bibliotecas necessárias
library(dplyr)
library(gdata)
library(ggplot2)

# Aponta para o diretório onde estão os arquivos
setwd("~/analise-series-historicas-b3")

# Carrega funções que serão utilizadas no script
source("funcoes.R")


# Realiza o carregamento do arquivo de texto
# Os arquivos poderão ser acessados pelo link oficial da B3:
# https://www.b3.com.br/pt_br/market-data-e-indices/servicos-de-dados/market-data/historico/mercado-a-vista/series-historicas/

df <- ler_arquivo("COTAHIST_A2022.TXT")

# Faz a leitura das primeiras linhas do arquivo
head(df)

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


# Resumo estatístico
summary(df$PREMAX)

# Empresas
table(df$CODNEG)

head(df)


# Codigo de Negociação do papel (CODNEG)

COD = 'ELET6'

dfCODNEG <- filter(df, trim(CODNEG) == COD)


# Gera gráfico de linhas para Preço de Abertura do Papelmercado no pregão
titulo = paste("Evolução do Preço de Abertura. Código:", COD, sep = ' ')
cor="blue"
gerar_grafico(dfCODNEG, dfCODNEG$DATAP, dfCODNEG$PREABE, titulo, cor)

# Gera gráfico de linhas para Preço de Abertura do Papelmercado no pregão
titulo = paste("Evolução do Preço Máximo. Código:", COD, sep = ' ')
cor="green"
  gerar_grafico(dfCODNEG, dfCODNEG$DATAP, dfCODNEG$PREMAX, titulo, cor)


# Libera memória
unlink(df)
