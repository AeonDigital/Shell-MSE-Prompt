#!/bin/bash -eu
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Efetua o processamento das configurações do prompt conforme elas estão
# definidas nas variáveis de configuração e retorna uma string de prompt
# para ser visualizada ou já como um código a ser incorporado no uso do
# terminal.
#
# @param bool $1
# Use '0' se quiser apenas obter uma versão de visualização do prompt
# atualmente configurado.
# Use '1' se desejar que o resultado obtido vá ser usado para alterar
# o prompt do terminal.
#
# @exemple
#   PS1=$(mse_prompt_retrieveCode 1)
mse_prompt_retrieveCode() {

  #
  # primeiramente identifica o squema do estilo de prompt que será setado
  # e seus respectivos placeholders
  local mseStyleName=${MSE_MD_PROMPT_SELECTED_STYLE_NAME}
  local mseRawPromptSquema

  if [ "${mseStyleName}" != "" ]; then
    mseRawPromptSquema=${MSE_MD_PROMPT_STYLE_SQUEMA[${mseStyleName}]}
    declare -a msePromptPlaceHolders=(${MSE_MD_PROMPT_STYLE_PLACEHOLDER[${mseStyleName}]// / })

    local msePHName


    #
    # Identifica o tipo de retorno a ser feito.
    local mseRetrieveLikeCode=0
    if [ $# -ge 1 ] && [ $1 == 1 ]; then
      mseRetrieveLikeCode=1
    fi


    local msePHUseSample
    local mseREG
    local mseRawPromptSquema



    #
    # Para cada placeholder configurado
    # aplica o estilo nas posições correspondentes
    for msePHName in "${msePromptPlaceHolders[@]}"; do
      #
      # Existindo configuração para o placeholder atual no prompt
      # atualmente selecionado...
      declare -a  msePHRawConfig=()
      if [ "${MSE_MD_PROMPT_SELECTED_PH_COLOR[$msePHName]+x}" ]; then
        #
        # resgata as configurações do respectivo placeholder
        # e as separa devidamente.
        msePHRawConfig=(${MSE_MD_PROMPT_SELECTED_PH_COLOR[$msePHName]// / })
      fi



      if [ $mseRetrieveLikeCode == 1 ]; then
        msePHUseSample=${MSE_MD_PROMPT_PLACEHOLDER_SAMPLE[$msePHName]}
      else
        msePHUseSample='[['${msePHName}']]'${MSE_MD_PROMPT_PLACEHOLDER_EXAMPLE[$msePHName]}

        #
        # Substitui qualquer ocorrencia de um '/' no sample por sua versão
        # 'escapada' que é '\/'
        if [[ "${msePHUseSample}" == *"/"* ]]; then
          mseREG='s/\//\\\//g'
          msePHUseSample="$(printf '%s' "$msePHUseSample" | sed -e "${mseREG}")"
        fi

        #
        # Substitui qualquer ocorrencia de um '$' no sample por sua versão
        # 'escapada' que é '\$'
        if [[ "${msePHUseSample}" == *"\$"* ]]; then
          mseREG='s/\$/\\\\$/g'
          msePHUseSample="$(printf '%s' "$msePHUseSample" | sed -e "${mseREG}")"
        fi

        #
        # Remove qualquer ocorrencia de um 'zcolor_xx' no sample
        if [[ "${msePHUseSample}" == *"zcolor_"* ]]; then
          mseREG='s/zcolor_[0-9][0-9]//g'
          msePHUseSample="$(printf '%s' "$msePHUseSample" | sed -e "${mseREG}")"
        fi
      fi



      #
      # Se não tiver uma configuração válida para este placeholder...
      if [ ${#msePHRawConfig[@]} != 4 ]; then
        #
        # Adiciona um marcador '[[NONE]]' para que este placeholder perca
        # qualquer configuração que tenha sido adicionado anterior a ele.
        mseREG='s/\[\['${msePHName}'\]\]/\[\[NONE\]\]\[\['${msePHName}'\]\]/g'
        msePHUseSample="$(printf '%s' "$msePHUseSample" | sed -e "${mseREG}")"
      else
        #
        # Monta o código da cor que deve ser usada para este placeholder
        msePHUseColor=$(mse_font_createStyle "${msePHRawConfig[0]}" "${msePHRawConfig[1]}" "${msePHRawConfig[2]}" "${msePHRawConfig[3]}")

        #
        # Substitui no 'sample' do placeholder o seu marcador pela cor
        # definida para ele.
        mseREG='s/\[\['$msePHName'\]\]/\[\[NONE\]\]\\\\[\\\\'$msePHUseColor'\\\\]/g'
        msePHUseSample="$(printf '%s' "$msePHUseSample" | sed -e "${mseREG}")"
      fi

      #
      # Efetivamente substitui o placeholder do schema do prompt
      # por sua versão estilizada.
      mseREG='s/\[\['$msePHName'\]\]/'$msePHUseSample'/g'
      mseRawPromptSquema="$(printf '%s' "$mseRawPromptSquema" | sed -e "${mseREG}")"
    done


    #
    # Substitui o 'pseudo-placeholder' [[NONE]] pelo código que interrompe
    # qualquer estilo de cor anterior 'zerando' assim o estilo deste ponto
    # em diante.
    mseREG='s/\[\[NONE\]\]/\\[\\'${mseNONE}'\\]/g'
    mseRawPromptSquema="$(printf '%s' "$mseRawPromptSquema" | sed -e "${mseREG}")"
  fi


  printf '%s' "${mseRawPromptSquema}"
}
MSE_GLOBAL_CMD["prompt retrieve code"]="mse_prompt_retrieveCode"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_prompt_retrieveCode_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="RetrieveLikeCode :: r :: bool"
}
