#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Ação que deve ser executada apenas no momento da instalação deste módulo.
mse_module_onInstall() {
  local mseHOME=$([ ! -z "${XDG_MAIN_HOME}" ] && echo "${XDG_MAIN_HOME}" || echo "${HOME}")
  local mseInstallationPath="${mseHOME}/apps/myShellEnv"
  local mseConfigFilePath="${mseInstallationPath}/config.sh"

  if [ -f "${mseConfigFilePath}" ]; then
    local mseControlVariables=""
    local mseConfigFileContent=$(< "${mseConfigFilePath}")
    local mseInitiCodeMatch="0"

    mseControlVariables=""
    mseControlVariables+="\n\n\n\n\n"
    mseControlVariables+="# [[INI-MSE_MD_PROMPT_SELECTED_STYLE_NAME]]\n"
    mseControlVariables+="MSE_MD_PROMPT_SELECTED_STYLE_NAME=\"NEWLINE\"\n"
    mseControlVariables+="# [[END-MSE_MD_PROMPT_SELECTED_STYLE_NAME]]\n\n"

    mseControlVariables+="# [[INI-MSE_MD_PROMPT_SELECTED_PH_COLOR]]\n"
    mseControlVariables+="declare -gA MSE_MD_PROMPT_SELECTED_PH_COLOR\n"
    mseControlVariables+="MSE_MD_PROMPT_SELECTED_PH_COLOR[\"PROMPT_SIGN\"]=\"4 BOLD NONE LBLUE\"\n"
    mseControlVariables+="MSE_MD_PROMPT_SELECTED_PH_COLOR[\"USERNAME\"]=\"4 NONE NONE DWHITE\"\n"
    mseControlVariables+="MSE_MD_PROMPT_SELECTED_PH_COLOR[\"AT_SIGN\"]=\"4 BOLD NONE LBLUE\"\n"
    mseControlVariables+="MSE_MD_PROMPT_SELECTED_PH_COLOR[\"HOSTNAME_SHORT\"]=\"4 NONE NONE DWHITE\"\n"
    mseControlVariables+="MSE_MD_PROMPT_SELECTED_PH_COLOR[\"ZCOLOR_01\"]=\"4 BOLD NONE LBLUE\"\n"
    mseControlVariables+="MSE_MD_PROMPT_SELECTED_PH_COLOR[\"DIRECTORY_PATH\"]=\"4 NONE NONE DWHITE\"\n"
    mseControlVariables+="# [[END-MSE_MD_PROMPT_SELECTED_PH_COLOR]]\n"


    #
    # Verifica se já não há tais marcadores no arquivo de configuração
    local mseLineRaw
    while read mseLineRaw || [ -n "${mseLineRaw}" ]; do
      if [[ "${mseLineRaw}" =~ "# [[INI-MSE_MD_PROMPT_SELECTED_STYLE_NAME]]" ]]; then
        mseInitiCodeMatch=1
        break
      fi
    done <<< "$mseConfigFileContent"

    if [ "${mseInitiCodeMatch}" == 0 ]; then
      printf "${mseControlVariables}" >> "${mseConfigFilePath}"
    fi
  fi
}





#
# Ação que deve ser executada apenas no momento da desinstalação deste módulo.
mse_module_onUninstall() {
  local doNothing=""
}
