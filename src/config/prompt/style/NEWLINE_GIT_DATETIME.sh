#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Exemplo:
# $ username@host in ~/atual/directory/path ( main* )                                              YYYY-MM-DD HH:MM:SS
# > _
MSE_PROMPT_STYLE_EXAMPLE="${mseNONE}\$ username@host in ~/atual/directory/path ( main* ) \r\e[120C\e[20DYYYY-MM-DD HH:MM:SS \n> _"
MSE_PROMPT_STYLE_SQUEMA='[[PROMPT_SIGN]] [[USERNAME]][[AT_SIGN]][[HOSTNAME_SHORT]][[ZCOLOR_01]] in [[NONE]][[DIRECTORY_PATH]] [[NONE]][[GIT_BRACKET_INI]][[GIT_BRANCH]][[GIT_STATUS]][[GIT_BRACKET_END]] [[DATETIME_AT_RIGHT]]\n\076[[NONE]]\040'
MSE_PROMPT_STYLE_PLACEHOLDER='PROMPT_SIGN USERNAME AT_SIGN HOSTNAME_SHORT ZCOLOR_01 DIRECTORY_PATH GIT_BRACKET_INI GIT_BRANCH GIT_STATUS GIT_BRACKET_END DATETIME_AT_RIGHT'
