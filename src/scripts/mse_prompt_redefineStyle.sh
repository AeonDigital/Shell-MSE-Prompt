#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Define o estilo do prompt que será usado.
# A alteração de estilo é feita imediatamente mas não será efetivada para
# as próximas sessões a não ser que seja usado o comando
# "mse_term_savePromptConfig".
#
# Caso queira retornar para a configuração original da sessão use o comando
# "mse_term_restorePromptSettings".
#
# @param string|int $1
# Estilo do prompt a ser usado (pelo nome ou pelo índice).
#
# @example
#   mse_prompt_redefineStyle SIMPLE
mse_prompt_redefineStyle() {
  if [ $# -ge 1 ]; then
    local mseIsValid=$(mse_check_hasValueInArray "${1^^}" "MSE_MD_PROMPT_STYLE_NAME")


    if [ $mseIsValid == 0 ]; then
      local mseTtl
      local mseMsg

      mseTtl=$(mse_str_replacePlaceHolder "${lbl_err_paramA_HasInvalidValue}" "PARAM_A" "Style")
      mseMsg=$(mse_str_replacePlaceHolder "${lbl_err_checkForValidOptionsUsingFunction}" "FUNCTION" "mse_prompt_showStyles")

      declare -a mseArrMsg
      mseArrMsg+=("${mseMsg}")

      mse_inter_showError "${FUNCNAME[0]}::${mseTtl}" "mseArrMsg"
    else
      MSE_MD_PROMPT_SELECTED_STYLE_NAME="${1^^}"
      PS1=$(mse_prompt_retrieveCode 1)
    fi
  fi
}
MSE_GLOBAL_CMD["prompt redefine style"]="mse_prompt_redefineStyle"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_prompt_redefineStyle_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Style :: r :: string"
}
