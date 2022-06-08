#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Define o estilo de cor para um "placeholder" do prompt atualmente definido.
#
# ATENÇÃO:
# Valores inválidos de atributos ou cores tentarão ser forçados para gerar
# um resultado válido.
#
#
# @param string $1
# Nome do placeholder a ser definido.
#
#
# @param string $2
# Sistema de cor.
# Há 3 sistemas de descrição de cores que podem ser usados conforme a
# compatibilidade do seu terminal.
# Escolha uma destas:
#
#   - 4   : Usa 4 bits para representação das cores (16 cores).
#           Este é o sistema mais comum entre os diversos terminais.
#   - 8   : Usa 8 bits para representação das cores (256 cores).
#   - 32  : Usa 32 bits para representação das cores (true color).
#
# Se omitido, ou, se fornecido um valor inválido, será usada a representação
# de 4 bits como padrão.
#
#
#
# @param string|int $3
# Código ou nome do atributo de fonte a ser usado.
# Você pode definir mais de um valor bastando separá-los por virgula.
#
#   Código  : Nome        : Efeito
#           : NONE        : Nada
#    1      : BOLD        : Negrito
#    2      : DARK        : Escurecido
#    3      : ITALIC      : Itálico
#    4      : UNDERLINE   : Sublinhado
#    5      : BLINKS      : Piscando (lento)
#    6      : BLINKF      : Piscando (rápido)
#    7      : REVERSE     : Inverte a seleção de cor de fonte e cor de fundo
#    8      : HIDE        : Oculto
#    9      : STRIKE      : Riscado
#
# Valores considerados inválidos serão ignorados.
#
#
#
# @param string|int $4
# Cor do fundo a ser usada. O valor a ser descrito varia conforme o tipo
# do sistema de cores selecionado.
#
# Sistema 4 bits
# Neste caso você pode usar o código ou o nome da cor conforme a tabela abaixo:
#
#   Código  : Nome        : Efeito
#   Paleta Normal
#           : NONE        : Nada
#   40      : BLACK       : Preto
#   41      : RED         : Vermelho
#   42      : GREEN       : Verde
#   43      : YELLOW      : Amarelo
#   44      : BLUE        : Azul
#   45      : PURPLE      : Púrpura
#   46      : CYAN        : Ciano
#   47      : WHITE       : Branco
#
#   Paleta Light / Luminosa
#   100     : LBLACK      : Preto
#   101     : LRED        : Vermelho
#   102     : LGREEN      : Verde
#   103     : LYELLOW     : Amarelo
#   104     : LBLUE       : Azul
#   105     : LPURPLE     : Púrpura
#   106     : LCYAN       : Ciano
#   107     : LWHITE      : Branco
#
#
# Sistema de 8 bits
# Informe um valor entre 0 e 255 para a cor desejada.
# O valor padrão neste caso é "0" (preto)
#
# Sistema de 32 bits
# Informe um valor entre 0 e 255 para cada um dos vetores R, G e B separados
# por ";".
# O valor padrão neste caso é "0;0;0" (preto)
#
# Valores considerados inválidos serão revertidos para o valor padrão de cada
# sistema.
#
#
#
# @param string|int $5
# Cor da fonte a ser usada. O valor a ser descrito varia conforme o tipo
# do sistema de cores selecionado.
#
# Sistema de 4 bits
# Neste caso você pode usar o código ou o nome da cor conforme a tabela abaixo:
# Obs: a versão 'DARK' das cores é uma implementação não padrão e funciona
# apenas como um 'wrapper' para definir a referida cor com o atributo DARK.
#
#   Código  : Nome        : Efeito
#   Paleta Normal
#           : NONE        : Nada
#   30      : BLACK       : Preto
#   31      : RED         : Vermelho
#   32      : GREEN       : Verde
#   33      : YELLOW      : Amarelo
#   34      : BLUE        : Azul
#   35      : PURPLE      : Púrpura
#   36      : CYAN        : Ciano
#   37      : WHITE       : Branco
#
#   Paleta Normal + Atributo Dark
#   230     : DBLACK      : Preto
#   231     : DRED        : Vermelho
#   232     : DGREEN      : Verde
#   233     : DYELLOW     : Amarelo
#   234     : DBLUE       : Azul
#   235     : DPURPLE     : Púrpura
#   236     : DCYAN       : Ciano
#   237     : DWHITE      : Branco
#
#   Paleta Light / Luminosa
#   90      : LBLACK      : Preto
#   91      : LRED        : Vermelho
#   92      : LGREEN      : Verde
#   93      : LYELLOW     : Amarelo
#   94      : LBLUE       : Azul
#   95      : LPURPLE     : Púrpura
#   96      : LCYAN       : Ciano
#   97      : LWHITE      : Branco
#
#   Paleta Light / Luminosa + Atributo Dark
#   290     : LDBLACK     : Preto
#   291     : LDRED       : Vermelho
#   292     : LDGREEN     : Verde
#   293     : LDYELLOW    : Amarelo
#   294     : LDBLUE      : Azul
#   295     : LDPURPLE    : Púrpura
#   296     : LDCYAN      : Ciano
#   297     : LDWHITE     : Branco
#
#
# Sistema de 8 bits
# Informe um valor entre 0 e 255 para a cor desejada.
# O valor padrão neste caso é "255" (branco)
#
# Sistema 32 bits
# Informe um valor entre 0 e 255 para cada um dos vetores R, G e B separados
# por ";".
# O valor padrão neste caso é "255;255;255" (branco)
#
# Valores considerados inválidos serão revertidos para o valor padrão de cada
# sistema.
#
#
#
# @example
#   mse_prompt_redefinePlaceHolder "PROMPT_SIGN" "4" "NONE" "LBLUE" "DWHITE"
mse_prompt_redefinePlaceHolder() {
  if [ $# -ge 5 ]; then
    #
    # Identifica os placeholders usados para o estilo do prompt
    # atualmente definido.
    local mseStyleName=${MSE_MD_PROMPT_SELECTED_STYLE_NAME}
    declare -a msePromptPlaceHolders=(${MSE_MD_PROMPT_STYLE_PLACEHOLDER[${mseStyleName}]// / })




    #
    # Apenas se o placeholder alvo existe entre aqueles que estão definidos para
    # o prompt atual...
    local mseIsValid
    mseIsValid=$(mse_check_hasValueInArray "${1^^}" "msePromptPlaceHolders")
    if [ "${mseIsValid}" == "1" ]; then
      local mseTargetPHName="${1^^}"
      local mseTargetColorSystem="${2^^}"
      local mseTargetAttribute="${3^^}"
      local mseTargetBGColor="${4^^}"
      local mseTargetFGColor="${5^^}"


      #
      # Se a seleção das propriedades é válida
      if [ $mseIsValid == 1 ]; then
          MSE_MD_PROMPT_SELECTED_PH_COLOR[$mseTargetPHName]="${mseTargetColorSystem} ${mseTargetAttribute} ${mseTargetBGColor} ${mseTargetFGColor}"
          PS1=$(mse_prompt_retrieveCode 1)
      fi
    fi
  fi
}
MSE_GLOBAL_CMD["prompt redefine placeholder"]="mse_prompt_redefinePlaceHolder"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_prompt_redefinePlaceHolder_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=5
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="PlaceHolderName :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="ColorSystem :: r :: list :: 4"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1_labels"]="4, 8, 32"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1_values"]="4, 8, 32"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="Attributes :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2_labels"]="BOLD, DARK, ITALIC, UNDERLINE, BLINKS, BLINKF, REVERSE, HIDE, STRIKE, NONE, RBOLD, RDARK, RITALIC, RUNDERLINE, RBLINKS, RBLINKF, RREVERSE, RHIDE, RSTRIKE"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2_values"]="1, 2, 3, 4, 5, 6, 7, 8, 9, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="BGColor :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4"]="FGColor :: r :: string"
}
