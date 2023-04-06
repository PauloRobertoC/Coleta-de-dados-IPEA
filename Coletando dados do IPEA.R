# Analise de Conjuntura Economica 
# Coleta de Dados Macroeconomicos
# Paulo Roberto Carneiro de Sá

# Pacotes -----------------------------------------------------------------

# Carregar pacotes/dependências

# Carregar pacotes/dependências

library(GetBCBData) # BCB
library(rbcb)       # BCB
library(ipeadatar)  # IPEADATA
library(sidrar)     # SIDRA
library(rdbnomics)  # FMI, OCDE e outros
library(WDI)        # Banco Mundial
library(dplyr)      # pacotes de tratamento de dados
library(stringr)    # Tratar dados do tipo texto, string, character
library(tidyr)      # Transformacao e tratamento de dados
library(magrittr)   # Para utilizar o operador pipe
library(tsibble)    # 
library(ggplot2)    # Criar graficos

# Dados do IPEADATA -------------------------------------------------------

# Site: http://www.ipeadata.gov.br/
# Extrair tabela com todas séries e códigos disponíveis

series_ipeadata <- ipeadatar::available_series()

#filtrando series com o termo "caged"

series_ipeadata %>% 
  dplyr::filter(
    stringr::str_detect(
      string = source,
      pattern = stringr:: regex("caged", ignore_case = TRUE)
    )
  )

# coletar serie de interesse usando o codigo especifico da base de dados

dados_ipeadata <- ipeadatar::ipeadata("CAGED12_SALDON12")

head(dados_ipeadata) # vendo as primeiras observacoes
tail(dados_ipeadata) #vendo as ultimas observacoes

# coletar multiplas series

dados_ipeadata <- ipeadatar::ipeadata(
  c(
    "caged"   = "CAGED12_SALDON12",
    "embi_br" = "JPM366_EMBI366"
  )
)

head(dados_ipeadata)
tail(dados_ipeadata)

# tratamento de dados 

dados_ipeadata %>%
  tidyr::pivot_wider(
    id_cols = "date",
    names_from = "code",
    values_from = "value"
  ) %>%
  dplyr::rename(
    "data" = "date",
    "caged" = "CAGED12_SALDON12",
    "embi_br" = "JPM366_EMBI366"
  ) %>%
  dplyr::arrange(dplyr::desc(data))

head(dados_ipeadata)
tail(dados_ipeadata)

### Plotando um grafico 






















































































