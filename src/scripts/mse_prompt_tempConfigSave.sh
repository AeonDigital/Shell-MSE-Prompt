#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Salva temporariamente (na memória) as configurações atualmente definidas do
# prompt. Use como um 'checkpoint' para testar diferentes configurações antes
# de efetivamente salvar
mse_prompt_tempConfigSave() {
  #
  # Reinicia as configurações temporárias
  unset MSE_MD_TERM_TEMP_PROMPT_CONFIG
  declare -gA MSE_MD_TERM_TEMP_PROMPT_CONFIG
  MSE_MD_TERM_TEMP_PROMPT_CONFIG[STYLE_NAME]="${MSE_MD_PROMPT_SELECTED_STYLE_NAME}"


  #
  # Identifica os placeholders usados para o estilo do prompt
  # atualmente definido.
  local mseStyleName=${MSE_MD_PROMPT_SELECTED_STYLE_NAME}
  declare -a msePromptPlaceHolders=(${MSE_MD_PROMPT_STYLE_PLACEHOLDER[${mseStyleName}]// / })


  #
  # Para cada placeholder do estilo selecionado
  local msePHName
  for msePHName in "${msePromptPlaceHolders[@]}"; do
    if [ ! -z "${MSE_MD_PROMPT_SELECTED_PH_COLOR[$msePHName]+x}" ]; then
      MSE_MD_TERM_TEMP_PROMPT_CONFIG[${msePHName}]="${MSE_MD_PROMPT_SELECTED_PH_COLOR[$msePHName]}"
    fi
  done
}
MSE_GLOBAL_CMD["prompt temp save"]="mse_prompt_tempConfigSave"
