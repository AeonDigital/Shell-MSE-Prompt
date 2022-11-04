#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


MSE_PLACEHOLDER_SAMPLE='[[GIT_STATUS]]\$(mse_prompt_ph_showGitStatus)'
MSE_PLACEHOLDER_EXAMPLE='*'


#
# Função que preenche este placeholder
mse_prompt_ph_showGitStatus () {
  local status=$(git status --porcelain 2>/dev/null)
  if [ "${status}" != "" ]; then
    printf "*"
  fi
}
