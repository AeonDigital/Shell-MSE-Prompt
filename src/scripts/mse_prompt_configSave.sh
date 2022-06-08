#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Salva as configurações atualmente definidas do prompt
# no arquivo indicado na variável 'MSE_MD_TERM_PATH_TO_PROMPT_CONFIG_FILE'.
mse_prompt_configSave() {
  local mseCode=1
  local mseMsgTtl
  declare -a mseMsgBody=()

  local mseInstallationPath="${HOME}/.config/myShellEnv"
  local msePromptConfigurationDirectory=$(basename -- "${MSE_MD_TERM_PATH_TO_PROMPT_CONFIG_FILE}")


  #
  # Se o arquivo apontado na variável de configuração não existe...
  if [ "${MSE_MD_TERM_PATH_TO_PROMPT_CONFIG_FILE}" != "" ] && [ ! -f "${MSE_MD_TERM_PATH_TO_PROMPT_CONFIG_FILE}" ]; then
    mseMsgBody+=($(mse_str_replacePlaceHolder "${lbl_generic_fileNotFound}" "[[FILE]]" "${MSE_MD_TERM_PATH_TO_PROMPT_CONFIG_FILE}"))
    mse_inter_errorAlert "MSE" "${lbl_generic_cannotFoundConfigFile}" "mseMsgBody"
  else

    #
    # Inicia o novo arquivo de configuração com os dados atuais
    local mseRawFile=""
    mseRawFile+="#!/usr/bin/env bash\n"
    mseRawFile+="# myShellEnv v 1.0 [aeondigital.com.br]\n"
    mseRawFile+="\n\n"
    mseRawFile+="MSE_MD_PROMPT_SELECTED_STYLE_NAME=\"${MSE_MD_PROMPT_SELECTED_STYLE_NAME}\"\n"


    #
    # Identifica os placeholders usados para o estilo do prompt
    # atualmente definido.
    declare -a msePSQUEMAPH=(${MSE_MD_PROMPT_STYLE_PLACEHOLDER[${MSE_MD_PROMPT_SELECTED_STYLE_NAME}]})


    #
    # Para cada placeholder do estilo selecionado
    local msePHName
    local msePHConfig
    for msePHName in "${msePSQUEMAPH[@]}"; do
      msePHConfig="${MSE_MD_PROMPT_SELECTED_PH_COLOR[$msePHName]}"
      mseRawFile+="MSE_MD_PROMPT_SELECTED_PH_COLOR[${msePHName}]=\"${msePHConfig}\"\n"
    done


    #
    # Salva as configurações atuais no arquivo de recuperação
    cp "$MSE_MD_TERM_PATH_TO_PROMPT_CONFIG_FILE" "${msePromptConfigurationDirectory}/.promptConfig-bk-$(date +%s).sh"
    #
    # Salva as novas configurações sobre as antigas
    printf "${mseRawFile}" > "${MSE_MD_TERM_PATH_TO_PROMPT_CONFIG_FILE}"
    if [ $? == 0 ]; then
      mse_inter_alertUser "s" "MSE" "${lbl_generic_save}" "" ""
      mseCode=0
    else
      mseMsgBody+=($(mse_str_replacePlaceHolder "${lbl_generic_fileNotFound}" "[[FILE]]" "${MSE_MD_TERM_PATH_TO_PROMPT_CONFIG_FILE}"))
      mseMsgBody+=("- ${lbl_generic_checkConfigFile}")
      mseMsgBody+=("- ${lbl_generic_checkPermissions}")
      mse_inter_errorAlert "MSE" "${lbl_generic_cannotSaveinFile}" "mseMsgBody"
    fi
  fi

  return $mseCode
}
MSE_GLOBAL_CMD["prompt config save"]="mse_prompt_configSave"
