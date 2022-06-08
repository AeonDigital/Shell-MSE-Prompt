#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Restaura as configurações do último prompt salvo usando a
# função 'mse_prompt_tempConfigSave'
mse_prompt_tempConfigRestore() {
  local mseKey

  #
  # Reseta as configurações dos placeholders do prompt
  unset MSE_MD_PROMPT_SELECTED_PH_COLOR
  declare -gA MSE_MD_PROMPT_SELECTED_PH_COLOR

  for mseKey in "${!MSE_MD_TERM_TEMP_PROMPT_CONFIG[@]}"; do
    if [ "${mseKey}" == "STYLE_NAME" ]; then
      MSE_MD_PROMPT_SELECTED_STYLE_NAME="${MSE_MD_TERM_TEMP_PROMPT_CONFIG[${mseKey}]}"
    else
      MSE_MD_PROMPT_SELECTED_PH_COLOR[${mseKey}]="${MSE_MD_TERM_TEMP_PROMPT_CONFIG[${mseKey}]}"
    fi
  done

  #
  # Efetivamente restaura o prompt com os valores salvos temporariamente.
  PS1=$(mse_prompt_retrieveCode 1)
}
MSE_GLOBAL_CMD["prompt temp restore"]="mse_prompt_tempConfigRestore"
