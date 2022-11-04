#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Salva as configurações atualmente definidas do prompt no arquivo de
# configuração da instância "myShellEnv".
#
# Por precaução, criará um arquivo de backup dentro do diretório base
# do seu "myShellEnv" cujo nome será "config-bk-prompt-DATE.sh"
mse_prompt_configSave() {
  local mseCode=1
  local mseExecResult

  local mseInstallationPath="${HOME}/.config/myShellEnv"

  #
  # Salva as configurações atuais em um arquivo de recuperação
  cp "$mseInstallationPath}/config.sh" "${mseInstallationPath}/config-bk-prompt-$(date +%s).sh"
  if [ $? == 0 ]; then
    mseExecResult=$(mse_conf_setVariable "${mseInstallationPath}/config.sh" "#" "0" "" "s" "MSE_MD_PROMPT_SELECTED_STYLE_NAME" "${MSE_MD_PROMPT_SELECTED_STYLE_NAME}" "")
    if [ "${mseExecResult}" == "1" ]; then
      mseExecResult=$(mse_conf_setVariable "${mseInstallationPath}/config.sh" "#" "0" "" "a" "MSE_MD_PROMPT_SELECTED_PH_COLOR" "${MSE_MD_PROMPT_SELECTED_PH_COLOR}" "")
      if [ "${mseExecResult}" == "1" ]; then
        mseCode=0
      fi
    fi
  fi

  return $mseCode
}
MSE_GLOBAL_CMD["prompt config save"]="mse_prompt_configSave"
