
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

preco_abertura_medio <- aggregate(data = df, PREABE ~ CODNEG, mean)
preco_maximo_medio <- aggregate(data = df, PREMAX ~ CODNEG, mean)
preco_minimo_medio <- aggregate(data = df, PREMIN ~ CODNEG, mean)
preco_medio_medio <- aggregate(data = df, PREMED ~ CODNEG, mean)
preco_ultimo_medio <- aggregate(data = df, PREULT ~ CODNEG, mean)
preco_compra_medio <- aggregate(data = df, PREOFC ~ CODNEG, mean)
preco_venda_medio <- aggregate(data = df, PREOFV ~ CODNEG, mean)


# Libera memória
unlink(df)
