
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


# Gera gráfico de linhas para Preço de Abertura
titulo = paste("Análise do Preço de Abertura. Código:", COD, sep = ' ')
gerar_boxplot(dfCODNEG, dfCODNEG$CODNEG, dfCODNEG$PREABE, titulo)

# Gera gráfico de linhas para Preço Máximo
titulo = paste("Análise do Preço Máximo. Código:", COD, sep = ' ')
gerar_boxplot(dfCODNEG, dfCODNEG$CODNEG, dfCODNEG$PREMAX, titulo)

# Gera gráfico de linhas para Preço Mínimo
titulo = paste("Análise do Preço Mínimo Código:", COD, sep = ' ')
gerar_boxplot(dfCODNEG, dfCODNEG$CODNEG, dfCODNEG$PREMIN, titulo)

# Gera gráfico de linhas para Preço Médio
titulo = paste("Análise do Preço Médio Código:", COD, sep = ' ')
gerar_boxplot(dfCODNEG, dfCODNEG$CODNEG, dfCODNEG$PREMED, titulo)

# Gera gráfico de linhas para Preço do último negócio
titulo = paste("Análise do Preço do último negócio Código:", COD, sep = ' ')
gerar_boxplot(dfCODNEG, dfCODNEG$CODNEG, dfCODNEG$PREULT, titulo)

# Gera gráfico de linhas para Melhor oferta de compra
titulo = paste("Análise do Preço da Melhor Oferta de Compra Código:", COD, sep = ' ')
gerar_boxplot(dfCODNEG, dfCODNEG$CODNEG, dfCODNEG$PREOFC, titulo)
  
# Gera gráfico de linhas para Melhor oferta de venda
titulo = paste("Análise do Preço da Melhor Oferta de Venda Código:", COD, sep = ' ')
gerar_boxplot(dfCODNEG, dfCODNEG$CODNEG, dfCODNEG$PREOFV, titulo)

# Libera memória
unlink(df)
