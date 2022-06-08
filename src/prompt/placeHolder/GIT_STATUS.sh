#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


MSE_PLACEHOLDER_SAMPLE='[[GIT_STATUS]]\$(mse_prompt_ph_showGitStatus)'
MSE_PLACEHOLDER_EXAMPLE='*'


#
# Função que preenche este placeholder
mse_prompt_ph_showGitStatus () {
  local str=""
  local changes=$(git status --porcelain)

  if [ "$changes" != "" ]; then
    str="*"
  fi

  printf "${str}"
}
