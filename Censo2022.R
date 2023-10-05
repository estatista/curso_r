########################################################################
#' @descricao Populacao por municipio - Censo 2022
#' @author Marcos
#' @date   10/2022
########################################################################

# Packages:
library(readxl)      # leitura de arquivos excel
library(tidyverse)  # manipulação de dados
library(knitr)      # tabelas com visual mais interessante


# Baixe o arquivo do IBGE no link:
# https://ftp.ibge.gov.br/Censos/Censo_Demografico_2022/Populacao_e_domicilios_Primeiros_resultados/Anexos/CD2022_Populacao_Coletada_Imputada_e_Total_Municipio_e_UF.xlsx

# Após, salve na pasta Dados.

# Lista arquivos no diretório do projeto:
list.files("Dados")

# Nome do arquivo
arquivo <- "Dados/CD2022_Populacao_Coletada_Imputada_e_Total_Municipio_e_UF.xlsx"

# Leitura dos dados
dados <- read_excel(path = arquivo,
                    sheet = "Municípios",
                    range = "B3:H5573")

# Visualizacao inicial - checagem dos dados
View(dados)      # Abre a base de dados num formato parecido com planilha
names(dados)     # Mostra o nome das variáveis
head(dados)      # Mostra primeiras linhas da base     
tail(dados)      # Mostra últimas linhas da base
glimpse(dados)   # Mostra a transposta da base de dados

# Quantas pessoas existem no Brasil?
sum(dados$`POP. TOTAL`)

# Qual a média de pessoas por municipio?
mean(dados$`POP. TOTAL`)

# Quantas pessoas tem no menor município?
min(dados$`POP. TOTAL`)

# E quantas pessoas tem no maior município?
max(dados$`POP. TOTAL`)

# Qual o desvio padrão da população por município?
sd(dados$`POP. TOTAL`)




# Outra forma de somar:
dados %>% 
  summarize(soma = sum(`POP. TOTAL`))


# Quantas pessoas tem no DF?
dados %>% 
  filter(UF == "DF") %>% 
  summarize(soma = sum(`POP. TOTAL`))

# Quantas pessoas por UF?
dados %>% group_by(UF) %>% summarize(soma = sum(`POP. TOTAL`))

# Para visualizar melhor:
tab <- dados %>% group_by(UF) %>% summarize(soma = sum(`POP. TOTAL`))
kable(tab) # Função que faz tabelas mais bonitas do pacot 'knitr'.

# Ou ainda:
View(tab)


# Exercícios: 
# 1 Quantas pessoas foram efetivamente contadas no Censo? 
# 2 E quantas foram imputadas?
# 3 Em qual UF houve menos imputação?
# 4 E em qual houve mais imputação?
# 5 E em termos relativos?
# 6 Em quais municípios não foi necessário fazer imputação?
# 7 Quantos municípios por UF ficaram sem imputação?
