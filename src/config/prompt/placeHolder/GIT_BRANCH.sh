#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


MSE_PLACEHOLDER_SAMPLE='[[GIT_BRANCH]]\$(mse_prompt_ph_showGitBranch)'
MSE_PLACEHOLDER_EXAMPLE='main'


#
# Função que preenche este placeholder
mse_prompt_ph_showGitBranch () {
  local branch=$(git branch 2>/dev/null | grep '^*' | colrm 1 2)
  if [ "${branch}" != "" ]; then
    printf "${branch}"
  fi
}
