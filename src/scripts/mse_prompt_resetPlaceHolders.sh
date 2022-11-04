#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Reseta a configuração atual de todos os placeholders do prompt utilizado
# permitindo que eles fiquem visíveis para serem reconfigurados.
mse_prompt_resetPlaceHolders() {
  unset MSE_MD_PROMPT_SELECTED_PH_COLOR
  declare -gA MSE_MD_PROMPT_SELECTED_PH_COLOR
  PS1=$(mse_prompt_retrieveCode 1)
}
MSE_GLOBAL_CMD["prompt reset placeholders"]="mse_prompt_resetPlaceHolders"
