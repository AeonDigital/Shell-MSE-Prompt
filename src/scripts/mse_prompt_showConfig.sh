#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra as configurações do prompt referentes a seu estilo e as cores
# dos respectivos placeholders conforme estão atualmente definidos.
mse_prompt_showConfig() {
  #
  # Identifica os placeholders usados para o estilo do prompt
  # atualmente definido.
  local mseStyleName=${MSE_MD_PROMPT_SELECTED_STYLE_NAME}
  declare -a msePromptPlaceHolders=(${MSE_MD_PROMPT_STYLE_PLACEHOLDER[${mseStyleName}]// / })

  local msePHName


  local msePHUseColorSystem
  local msePHAttributes
  local msePHBGColor
  local msePHFGColor

  local msePHColor
  local msePHExample

  local mseRawTable


  for msePHName in "${msePromptPlaceHolders[@]}"; do
    #
    # resgata as configurações do respectivo placeholder
    # e as separa devidamente.
    declare -a  msePHRawConfig=(${MSE_MD_PROMPT_SELECTED_PH_COLOR[$msePHName]// / })

    msePHUseColorSystem='Error'
    msePHAttributes='Error'
    msePHBGColor='Error'
    msePHFGColor='Error'


    msePHColor=''
    msePHExample=${MSE_MD_PROMPT_PLACEHOLDER_EXAMPLE[$msePHName]}




    if [ ${#msePHRawConfig[@]} -ge 4 ]; then
      msePHUseColorSystem="${msePHRawConfig[0]}"
      msePHAttributes="${msePHRawConfig[1]}"
      msePHBGColor="${msePHRawConfig[2]}"
      msePHFGColor="${msePHRawConfig[3]}"

      msePHColor=$(mse_font_createStyle "${msePHUseColorSystem}" "${msePHAttributes}" "${msePHBGColor}" "${msePHFGColor}" "1")
      msePHExample="${msePHColor}${msePHExample}${mseNONE}"
    fi

    mseRawTable+="${msePHName}:${msePHAttributes}:${msePHBGColor}:${msePHFGColor}:${msePHExample}\n"
  done

  printf "\n"
  printf "STYLE: ${mseStyleName}\n"
  printf "${MSE_MD_PROMPT_STYLE_EXAMPLE[$mseStyleName]}\n"
  printf "\n"

  mseRawTable=$(printf "PlaceHolder:Attribute:BGColor:FontColor:Sample\n${mseRawTable}")
  column -e -s ":" -t <<< "${mseRawTable}"
  printf "\n"
}
MSE_GLOBAL_CMD["prompt show config"]="mse_prompt_showConfig"
