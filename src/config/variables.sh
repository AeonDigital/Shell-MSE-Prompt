#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]
# fontes de consulta
# - https://scriptim.github.io/bash-prompt-generator/





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
# [está comentado aqui para não interferir nas configurações locais]
# MSE_MD_PROMPT_SELECTED_STYLE_NAME=""


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
# [está comentado aqui para não interferir nas configurações locais]
# unset MSE_MD_PROMPT_SELECTED_PH_COLOR
# declare -gA MSE_MD_PROMPT_SELECTED_PH_COLOR





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
