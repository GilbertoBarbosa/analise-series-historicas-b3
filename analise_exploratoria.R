
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
total_registos_por_codigo <- table(df$CODNEG)

# Papéis por tipo de mercado
papeis_por_tipo <- unique(df[,c('TPMERC','CODNEG')])
table(papeis_por_tipo$TPMERC)

# Papéis por código BDI
papeis_por_bdi <- unique(df[,c('CODBDI','CODNEG')])
qtde_bdi <- data.frame(table(papeis_por_bdi$CODBDI))

# Codigo de Negociação do papel (CODNEG)

COD = 'BBAS3'

dfCODNEG <- filter(df, trim(CODNEG) == COD)


# Libera memória
unlink(df)
