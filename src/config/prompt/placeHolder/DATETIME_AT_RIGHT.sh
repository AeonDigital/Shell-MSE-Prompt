#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


MSE_PLACEHOLDER_SAMPLE='[[DATETIME_AT_RIGHT]]\$(mse_prompt_ph_showDateTimeAtRight)'
MSE_PLACEHOLDER_EXAMPLE='2022-02-28 14:55:17'


#
# Função que preenche este placeholder
mse_prompt_ph_showDateTimeAtRight () {
  local mseDateTime=$(printf '%(%Y-%m-%d %H:%M:%S)T')
  printf "\r\e[${COLUMNS}C\e[20D${mseDateTime}"
}

