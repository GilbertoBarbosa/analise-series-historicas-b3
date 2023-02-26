
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

# Faz a conversão de campos data e valores
converter_campos(df)

# Resumo estatístico
summary(df$PREMAX)

# Empresas
table(df$CODNEG)


# Codigo de Negociação do papel (CODNEG)

COD = 'ELET6'

dfCODNEG <- filter(df, trim(CODNEG) == COD)

x <- ts(dfCODNEG$PREULT, 1, 20, 12)

plot(stl(x, s.window = "per"))

# Libera memória
unlink(df)
