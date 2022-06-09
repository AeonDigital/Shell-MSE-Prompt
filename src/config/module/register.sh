#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Ação executada imediatamente ANTES de iniciar o registro do módulo.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está
# sendo registrado.
mse_registerModule_execOnStart() {
  local doNothing=""
}



#
# Ação executada imediatamente APÓS o fim do carregamento do módulo.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está
# sendo registrado.
mse_registerModule_execOnEnd() {
  #
  # Define o prompt conforme as configurações atualmente setadas.
  PS1=$(mse_prompt_retrieveCode 1)
}





#
# Ação executada imediatamente ANTES de carregar as configurações do locale.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está
# sendo registrado.
mse_registerModule_execBeforeLoadLocale() {
  local doNothing=""
}



#
# Ação executada imediatamente APÓS de carregar as configurações do locale.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está
# sendo registrado.
mse_registerModule_execAfterLoadLocale() {
  local doNothing=""
}





#
# Ação executada imediatamente ANTES de carregar as configurações de
# variáveis de ambiente.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está
# sendo registrado.
mse_registerModule_execBeforeLoadEnv() {
  local doNothing=""
}



#
# Ação executada imediatamente APÓS de carregar as configurações de
# variáveis de ambiente.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está
# sendo registrado.
mse_registerModule_execAfterLoadEnv() {
  local doNothing=""
}





#
# Ação executada imediatamente ANTES de carregar as variáveis do módulo.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está
# sendo registrado.
mse_registerModule_execBeforeLoadVariables() {
  local doNothing=""
}



#
# Ação executada imediatamente APÓS de carregar as variáveis do módulo.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está
# sendo registrado.
mse_registerModule_execAfterLoadVariables() {

  local mseTargetFiles
  local mseFilePath
  local mseFileBaseName

  #
  # Carrega os placeholders disponíveis para uso
  mseTargetFiles=$(find "${1}/config/prompt/placeHolder" -name "*.sh")
  if [ "${mseTargetFiles}" != "" ]; then
    while read mseFilePath; do
      mseFileBaseName=$(basename -- "$mseFilePath")
      mseFileBaseName="${mseFileBaseName%.*}"

      . "${mseFilePath}"

      MSE_MD_PROMPT_PLACEHOLDER_NAME+=("${mseFileBaseName}")
      MSE_MD_PROMPT_PLACEHOLDER_SAMPLE[${mseFileBaseName}]="${MSE_PLACEHOLDER_SAMPLE}"
      MSE_MD_PROMPT_PLACEHOLDER_EXAMPLE[${mseFileBaseName}]="${MSE_PLACEHOLDER_EXAMPLE}"
    done <<< ${mseTargetFiles}

    unset MSE_PLACEHOLDER_SAMPLE
    unset MSE_PLACEHOLDER_EXAMPLE
  fi



  #
  # Carrega os estilos de prompts disponíveis para uso
  mseTargetFiles=$(find "${1}/config/prompt/style" -name "*.sh")
  if [ "${mseTargetFiles}" != "" ]; then
    while read mseFilePath; do
      mseFileBaseName=$(basename -- "$mseFilePath")
      mseFileBaseName="${mseFileBaseName%.*}"

      . "${mseFilePath}"

      MSE_MD_PROMPT_STYLE_NAME+=("${mseFileBaseName}")
      MSE_MD_PROMPT_STYLE_EXAMPLE[${mseFileBaseName}]="${MSE_PROMPT_STYLE_EXAMPLE}"
      MSE_MD_PROMPT_STYLE_SQUEMA[${mseFileBaseName}]="${MSE_PROMPT_STYLE_SQUEMA}"
      MSE_MD_PROMPT_STYLE_PLACEHOLDER[${mseFileBaseName}]="${MSE_PROMPT_STYLE_PLACEHOLDER}"
    done <<< ${mseTargetFiles}

    unset MSE_PROMPT_STYLE_EXAMPLE
    unset MSE_PROMPT_STYLE_SQUEMA
    unset MSE_PROMPT_STYLE_PLACEHOLDER
  fi
}





#
# Ação executada imediatamente ANTES de carregar os aliases do módulo.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está
# sendo registrado.
mse_registerModule_execBeforeLoadAliases() {
  local doNothing=""
}



#
# Ação executada imediatamente APÓS de carregar os aliases do módulo.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está
# sendo registrado.
mse_registerModule_execAfterLoadAliases() {
  local doNothing=""
}





#
# Ação executada imediatamente ANTES de carregar os scripts do módulo.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está
# sendo registrado.
mse_registerModule_execBeforeLoadScripts() {
  local doNothing=""
}



#
# Ação executada imediatamente APÓS de carregar os scripts do módulo.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está
# sendo registrado.
mse_registerModule_execAfterLoadScripts() {
  local doNothing=""
}
