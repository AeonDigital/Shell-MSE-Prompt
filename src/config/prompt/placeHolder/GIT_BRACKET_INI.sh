#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


MSE_PLACEHOLDER_SAMPLE='[[GIT_BRACKET_INI]]\$(mse_prompt_ph_showGitBracketIni)'
MSE_PLACEHOLDER_EXAMPLE='( '


#
# Função que preenche este placeholder
mse_prompt_ph_showGitBracketIni () {
  local branch=$(git branch 2>/dev/null | grep '^*' | colrm 1 2)
  if [ "${branch}" != "" ]; then
    printf "( "
  fi
}

