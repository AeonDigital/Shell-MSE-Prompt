#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra os estilos de prompts que estão aptos a serem usados pelo usuário.
#
# @param mixed $1
# Se omitido apresentará todas as opções de prompt.
# Se "list", apresentará apenas a lista contendo o índice e respectivo nome.
# Se "index" (0, 1, 2...) apresentará apenas o respectivo prompt de índice indicado.
mse_prompt_showStyles() {
  local i
  local mseLength=${#MSE_MD_PROMPT_STYLE_NAME[@]}
  local mseType="complete"
  local msePHName

  if [ $# == 1 ]; then
    if [ $1 == "" ]; then
      mseType="complete"
    else
      if [ $1 == "list" ]; then
        mseType="list"
      else
        mseType="index"
      fi
    fi
  fi


  if [ $mseType == "complete" ] || [ $mseType == "list" ]; then
    printf "\n"
    for (( i=0; i<mseLength; i++)); do
      msePHName=${MSE_MD_PROMPT_STYLE_NAME[$i]}
      if [ $mseType == "complete" ]; then
        printf "[$i]  ${msePHName} \n"
        printf "${MSE_MD_PROMPT_STYLE_EXAMPLE[${msePHName}]} \n\n"
      else
        printf "[$i]  ${msePHName} \n"
      fi
    done

    if [ $mseType == "list" ]; then
      printf "\n"
    fi
  else
    local mseMsg
    local mseREG='^[0-9]+$'

    if ! [[ $1 =~ $mseREG ]]; then
      mseMsg=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsNot_A}" "PARAM_A" "Show" "A" "int")
      mse_inter_showError "${FUNCNAME[0]}::${mseMsg}"
    else
      if [ $1 -lt 0 ] || [ $1 -ge $mseLength ]; then
        mseMsg=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsOutOfRange}" "PARAM_A" "Show")
        mse_inter_showError "${FUNCNAME[0]}::${mseMsg}"
      else
        msePHName="${MSE_MD_PROMPT_STYLE_NAME[$1]}"

        printf "\n"
        printf "${msePHName} \n"
        printf "${MSE_MD_PROMPT_STYLE_EXAMPLE[$msePHName]} \n\n"
      fi
    fi
  fi
}
MSE_GLOBAL_CMD["prompt show styles"]="mse_prompt_showStyles"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_prompt_showStyles_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="ShowLike :: r :: string"
}
