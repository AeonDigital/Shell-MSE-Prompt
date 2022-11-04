#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra para o usuário todas as opções de 'placeholder' que podem
# ser estilizadas para os prompts atualmente registrados.
#
# @param bool $1
# Omita este parametro ou use "0" para mostrar todos os placeholders
# existentes.
# Use "1" para mostrar apenas aqueles que estão disponíveis para
# o estilo de prompt sendo usado.
mse_prompt_showPlaceHolders() {
  local mseRawTable

  local msePHIndex
  local msePHName
  local msePHExample
  local msePHActive

  local mseLength=${#MSE_MD_PROMPT_PLACEHOLDER_NAME[@]}
  local mseInUse

  local mseShowAll=1
  if [ $# == 1 ] && [ "$1" == "1" ]; then
    mseShowAll=0
  fi

  #
  # Identifica os placeholders usados para o estilo do prompt
  # atualmente definido.
  declare -a msePSQUEMAPH=(${MSE_MD_PROMPT_STYLE_PLACEHOLDER[${MSE_MD_PROMPT_SELECTED_STYLE_NAME}]// / })

  mseRawTable+="Index | Active | Name | Example\n"
  for (( msePHIndex=0; msePHIndex<mseLength; msePHIndex++)); do
    msePHName="${MSE_MD_PROMPT_PLACEHOLDER_NAME[$msePHIndex]}"
    msePHExample="${MSE_MD_PROMPT_PLACEHOLDER_EXAMPLE[$msePHName]}"
    msePHActive=""

    mseInUse=$(mse_check_hasValueInArray "${msePHName}" "msePSQUEMAPH")
    if [ "${mseShowAll}" == "1" ] || [ "${mseInUse}" == "1" ]; then
      if [ "${mseInUse}" == "1" ]; then
        msePHActive="*"
      fi

      mseRawTable+="${msePHIndex} | ${msePHActive} | ${msePHName} | ${msePHExample}\n"
    fi
  done

  printf "\n"
  mseRawTable=$(printf "${mseRawTable}")
  column -e -t -s "|" <<< "${mseRawTable}"
  printf "\n"
}
MSE_GLOBAL_CMD["prompt show placeholders"]="mse_prompt_showPlaceHolders"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_prompt_showPlaceHolders_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="OnlyEnabled :: r :: bool"
}
