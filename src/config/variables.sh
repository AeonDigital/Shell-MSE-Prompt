#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]
# fontes de consulta
# - https://scriptim.github.io/bash-prompt-generator/





#
# Especificação da cor padrão/nula do terminal para ser usada em todos
# os exemplos (samples) definidos.
NONE='\e[0m'





#
# Armazena o nome dos Placeholders disponíveis para configuração dos estilos
# de prompt.
#
# Placeholders são 'máscaras' de tipos de informação que podem serem usadas
# para compor cada estilo de prompt. Dentro do código do estilo use colchetes
# duplos e o nome do placeholder em maiúscula.
# Ex:
# [[PLACEHOLDER_NAME]]
#
# A marcação especial [[NONE]] não é um placeholder oficial mas pode ser usada
# para encerrar totalmente a estilização de uma cadeia de caracteres. Ela faz
# com que a marcação de texto volte ao padrão do terminal.
unset MSE_MD_PROMPT_PLACEHOLDER_NAME
declare -ga MSE_MD_PROMPT_PLACEHOLDER_NAME


#
# Armazena a string básica que representa o placeholder e que será usada como
# base para a montagem do prompt.
unset MSE_MD_PROMPT_PLACEHOLDER_SAMPLE
declare -gA MSE_MD_PROMPT_PLACEHOLDER_SAMPLE


#
# Armazena uma string que serve como exemplo de amostragem para o respectivo
# placeholder.
unset MSE_MD_PROMPT_PLACEHOLDER_EXAMPLE
declare -gA MSE_MD_PROMPT_PLACEHOLDER_EXAMPLE




#
# Armazena o nome de cada um dos prompts que serão disponibilizados
# para seleção do usuário.
unset MSE_MD_PROMPT_STYLE_NAME
declare -ga MSE_MD_PROMPT_STYLE_NAME


#
# Armazena um exemplo do prompt que pode ser impresso na tela para o
# usuário. Nenhuma cor deve ser usada.
unset MSE_MD_PROMPT_STYLE_EXAMPLE
declare -gA MSE_MD_PROMPT_STYLE_EXAMPLE


#
# Armazena o código do squema que efetivamente será usado para montar
# o prompt final que será aplicado no terminal.
unset MSE_MD_PROMPT_STYLE_SQUEMA
declare -gA MSE_MD_PROMPT_STYLE_SQUEMA


#
# Armazena os placeholders que são possíveis de serem configurados para
# cada um dos estilos de prompt.
unset MSE_MD_PROMPT_STYLE_PLACEHOLDER
declare -gA MSE_MD_PROMPT_STYLE_PLACEHOLDER





#
# Armazena as configurações temporárias para o estilo do prompt
# durante os testes de visualização do usuário.
unset MSE_MD_TERM_TEMP_PROMPT_CONFIG
declare -gA MSE_MD_TERM_TEMP_PROMPT_CONFIG


#
# Armazena o estilo do prompt que está salvo no momento.
MSE_MD_PROMPT_SELECTED_STYLE_NAME=""


#
# Armazena a coleção de cores definidas para cada um dos possíveis
# placeholders.
#
# Para cada placeholder, a configuração de cores deve ser armazenada numa
# única string onde cada item é separada por um espaço e respeitando a
# seguinte ordem:
#
# @example
#   [PLACEHOLDER]="FONTE FUNDO ATRIBUTO"
#   [SYMBOLS]="LGREY NONE DEFAULT"
#
unset MSE_MD_PROMPT_SELECTED_PH_COLOR
declare -gA MSE_MD_PROMPT_SELECTED_PH_COLOR





#
# Carrega os placeholders disponíveis para uso
MSE_TMP_PROMPT_PLACEHOLDERS=$(find "${MSE_TMP_THIS_MODULE_DIRECTORY}/prompt/placeHolder" -name "*.sh")
if [ "${MSE_TMP_PROMPT_PLACEHOLDERS}" != "" ]; then
  while read mseTmpPromptPlaceHolder; do
    mseTmpPlaceHolderName=$(basename -- "$mseTmpPromptPlaceHolder")
    mseTmpPlaceHolderName="${mseTmpPlaceHolderName%.*}"


    . "${mseTmpPromptPlaceHolder}"


    MSE_MD_PROMPT_PLACEHOLDER_NAME+=("${mseTmpPlaceHolderName}")
    MSE_MD_PROMPT_PLACEHOLDER_SAMPLE[${mseTmpPlaceHolderName}]="${MSE_PLACEHOLDER_SAMPLE}"
    MSE_MD_PROMPT_PLACEHOLDER_EXAMPLE[${mseTmpPlaceHolderName}]="${MSE_PLACEHOLDER_EXAMPLE}"

  done <<< ${MSE_TMP_PROMPT_PLACEHOLDERS}

  unset mseTmpPromptPlaceHolder
  unset mseTmpPlaceHolderName
  unset MSE_PLACEHOLDER_SAMPLE
  unset MSE_PLACEHOLDER_EXAMPLE
fi
unset MSE_TMP_PROMPT_PLACEHOLDERS





#
# Carrega os estilos de prompts disponíveis para uso
MSE_TMP_PROMPT_STYLES=$(find "${MSE_TMP_THIS_MODULE_DIRECTORY}/prompt/style" -name "*.sh")
if [ "${MSE_TMP_PROMPT_STYLES}" != "" ]; then
  while read mseTmpPromptStyle; do
    mseTmpStyleName=$(basename -- "$mseTmpPromptStyle")
    mseTmpStyleName="${mseTmpStyleName%.*}"


    . "${mseTmpPromptStyle}"


    MSE_MD_PROMPT_STYLE_NAME+=("${mseTmpStyleName}")
    MSE_MD_PROMPT_STYLE_EXAMPLE[${mseTmpStyleName}]="${MSE_PROMPT_STYLE_EXAMPLE}"
    MSE_MD_PROMPT_STYLE_SQUEMA[${mseTmpStyleName}]="${MSE_PROMPT_STYLE_SQUEMA}"
    MSE_MD_PROMPT_STYLE_PLACEHOLDER[${mseTmpStyleName}]="${MSE_PROMPT_STYLE_PLACEHOLDER}"

  done <<< ${MSE_TMP_PROMPT_STYLES}

  unset mseTmpPromptStyle
  unset mseTmpStyleName
  unset MSE_PROMPT_STYLE_EXAMPLE
  unset MSE_PROMPT_STYLE_SQUEMA
  unset MSE_PROMPT_STYLE_PLACEHOLDER
fi
unset MSE_TMP_PROMPT_STYLES




#
# Se o local onde as configurações do prompt devem ser salvas não estiver definida,
# será usado a configuração do prompt que vem junto com este módulo.
MSE_TMP_PATH_TO_DEFAULT_PROMPT_CONFIG_FILE="${MSE_TMP_THIS_MODULE_DIRECTORY}/prompt/config.sh"
if [ -z ${MSE_MD_TERM_PATH_TO_PROMPT_CONFIG_FILE+x} ]; then
  MSE_MD_TERM_PATH_TO_PROMPT_CONFIG_FILE="${MSE_TMP_PATH_TO_DEFAULT_PROMPT_CONFIG_FILE}"
fi
#
# Se o arquivo onde as configurações do prompt devem ser salvas não existe
# e sendo um valor diferente do arquivo de configurações padrão deste módulo
# usa o arquivo de configurações padrão como modelo para o arquivo final.
if [ ! -f "${MSE_MD_TERM_PATH_TO_PROMPT_CONFIG_FILE}" ] && [ "${MSE_TMP_PATH_TO_DEFAULT_PROMPT_CONFIG_FILE}" != "${MSE_MD_TERM_PATH_TO_PROMPT_CONFIG_FILE}" ]; then
  cp "${MSE_TMP_PATH_TO_DEFAULT_PROMPT_CONFIG_FILE}" "${MSE_MD_TERM_PATH_TO_PROMPT_CONFIG_FILE}"
fi
#
# Carrega as configurações do prompt
. "${MSE_MD_TERM_PATH_TO_PROMPT_CONFIG_FILE}"
unset MSE_TMP_PATH_TO_DEFAULT_PROMPT_CONFIG_FILE



#
# Triangular terminator
# Necessita de uma fonte do tipo 'Powerline' para ser mostrada
# https://github.com/powerline/fonts
#
# Char        : 
# Decimal     : 238 130 176
# Hex UTF-8   : EE 82 B0
# Octal UTF-8 : 356 202 260


#
# Git logo
# Necessita de uma fonte do tipo 'Powerline' para ser mostrada
# https://github.com/powerline/fonts
#
# Char        : 
# Decimal     : 238 130 160
# Hex UTF-8   : EE 82 A0
# Octal UTF-8 : 356 202 240
