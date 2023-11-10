
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

df <- ler_arquivo("COTAHIST_A2023.TXT")

# Faz a leitura das primeiras linhas do arquivo
head(df)

# Faz a conversão de campos data e valores
df <- converter_campos(df)


# Resumo estatístico
summary(df$PREMAX)

# Empresas
table(df$CODNEG)


# Codigo de Negociação do papel (CODNEG)

COD = 'BBAS3'

dfCODNEG <- filter(df, trim(CODNEG) == COD)


# Gera gráfico de linhas para Preço de Abertura
titulo = paste("Evolução do Preço de Abertura. Código:", COD, sep = ' ')
cor="blue"
gerar_grafico(dfCODNEG, dfCODNEG$DATAP, dfCODNEG$PREABE, titulo, cor)

# Gera gráfico de linhas para Preço Máximo
titulo = paste("Evolução do Preço Máximo. Código:", COD, sep = ' ')
cor="green"
gerar_grafico(dfCODNEG, dfCODNEG$DATAP, dfCODNEG$PREMAX, titulo, cor)

# Gera gráfico de linhas para Preço Mínimo
titulo = paste("Evolução do Preço Mínimo Código:", COD, sep = ' ')
cor="orange"
gerar_grafico(dfCODNEG, dfCODNEG$DATAP, dfCODNEG$PREMIN, titulo, cor)

# Gera gráfico de linhas para Preço Médio
titulo = paste("Evolução do Preço Médio Código:", COD, sep = ' ')
cor="brown"
gerar_grafico(dfCODNEG, dfCODNEG$DATAP, dfCODNEG$PREMED, titulo, cor)

# Gera gráfico de linhas para Preço do último negócio
titulo = paste("Evolução do Preço do último negócio Código:", COD, sep = ' ')
cor="red"
gerar_grafico(dfCODNEG, dfCODNEG$DATAP, dfCODNEG$PREULT, titulo, cor)

# Gera gráfico de linhas para Melhor oferta de compra
titulo = paste("Evolução do Preço da Melhor Oferta de Compra Código:", COD, sep = ' ')
cor="gray"
gerar_grafico(dfCODNEG, dfCODNEG$DATAP, dfCODNEG$PREOFC, titulo, cor)
  
# Gera gráfico de linhas para Melhor oferta de venda
titulo = paste("Evolução do Preço da Melhor Oferta de Venda Código:", COD, sep = ' ')
cor="black"
gerar_grafico(dfCODNEG, dfCODNEG$DATAP, dfCODNEG$PREOFV, titulo, cor)

# Libera memória
unlink(df)
