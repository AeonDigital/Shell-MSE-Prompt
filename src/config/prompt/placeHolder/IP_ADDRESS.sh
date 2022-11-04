#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


MSE_PLACEHOLDER_SAMPLE='[[IP_ADDRESS]]\$(mse_prompt_ph_showIpAddress)'
MSE_PLACEHOLDER_EXAMPLE='192.168.1.100'


#
# Função que preenche este placeholder
mse_prompt_ph_showIpAddress () {
  local str=$(ip route get 1.1.1.1 | grep -oP 'src \K\S+')
  printf "${str}"
}
