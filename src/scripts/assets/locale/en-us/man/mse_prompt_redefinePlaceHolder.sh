#
# @desc
# Sets the color style for a currently defined prompt "placeholder".
#
# WARNING:
# Invalid attribute or color values ​​will try to be forced to generate
# a valid result.
#
#
# @param string $1
# Name of the placeholder to be defined.
#
#
# @param string $2
# Color system.
# There are 3 color description systems that can be used as per the
# compatibility of your terminal.
# Choose one of these:
#
#   - 4   : Uses 4 bits for color representation (16 colors).
#           This is the most common system among the various terminals.
#   - 8   : Uses 8 bits for color representation (256 colors).
#   - 32  : Uses 32 bits for color representation (true color).
#
# If omitted, or if given an invalid value, the representation will be used
# 4-bit by default.
#
#
# @param string|int $3
# Code or name of the font attribute to use.
# You can set more than one value by separating them with a comma.
#
#   Code    : Name        : Effect
#           : NONE        : None
#   1       : BOLD        : Bold
#   2       : DARK        : Darkened
#   3       : ITALIC      : Italic
#   4       : UNDERLINE   : Underline
#   5       : BLINKS      : Blinking (slow)
#   6       : BLINKF      : Blinking (fast)
#   7       : REVERSE     : Inverts font color and background color selection
#   8       : HIDE        : Hidden
#   9       : STRIKE      : Scratched
#
# Values ​​considered invalid will be ignored.
#
#
#
# @param string|int $4
# Background color to use. The value to be described varies according to the type
# of the selected color system.
#
# 4 bit system
# In this case you can use the code or the color name as shown in the table below:
#
#   Code    : Name        : Effect
#   Normal Palette
#           : NONE        : None
#   40      : BLACK       : Black
#   41      : RED         : Red
#   42      : GREEN       : Green
#   43      : YELLOW      : Yellow
#   44      : BLUE        : Blue
#   45      : PURPLE      : Purple
#   46      : CYAN        : Cyan
#   47      : WHITE       : White
#
#   Light / Bright Palette
#   100     : LBLACK      : Black
#   101     : LRED        : Red
#   102     : LGREEN      : Green
#   103     : LYELLOW     : Yellow
#   104     : LBLUE       : Blue
#   105     : LPURPLE     : Purple
#   106     : LCYAN       : Cyan
#   107     : LWHITE      : White
#
#
# 8 bit system
# Enter a value between 0 and 255 for the desired color.
# The default value in this case is "0" (black)
#
# 32 bit system
# Enter a value between 0 and 255 for each of the separate R, G and B vectors
# per ";".
# The default value in this case is "0;0;0" (black)
#
# Values ​​considered invalid will be reverted to the default value of each
# system.
#
#
#
# @param string|int $5
# Font color to use. The value to be described varies according to the type
# of the selected color system.
#
# 4 bit system
# In this case you can use the code or the color name as shown in the table below:
# Note: the 'DARK' version of the colors is a non-standard implementation and works
# just as a 'wrapper' to set that color with the DARK attribute.
#
#   Code    : Name        : Effect
#   Normal Palette
#           : NONE        : None
#   30      : BLACK       : Black
#   31      : RED         : Red
#   32      : GREEN       : Green
#   33      : YELLOW      : Yellow
#   34      : BLUE        : Blue
#   35      : PURPLE      : Purple
#   36      : CYAN        : Cyan
#   37      : WHITE       : White
#
#   Normal Palette + Dark Attribute
#   230     : DBLACK      : Black
#   231     : DRED        : Red
#   232     : DGREEN      : Green
#   233     : DYELLOW     : Yellow
#   234     : DBLUE       : Blue
#   235     : DPURPLE     : Purple
#   236     : DCYAN       : Cyan
#   237     : DWHITE      : White
#
#   Light / Bright Palette
#   90      : LBLACK      : Black
#   91      : LRED        : Red
#   92      : LGREEN      : Green
#   93      : LYELLOW     : Yellow
#   94      : LBLUE       : Blue
#   95      : LPURPLE     : Purple
#   96      : LCYAN       : Cyan
#   97      : LWHITE      : White
#
#   Light / Bright Palette + Dark Attribute
#   290     : LDBLACK     : Black
#   291     : LDRED       : Red
#   292     : LDGREEN     : Green
#   293     : LDYELLOW    : Yellow
#   294     : LDBLUE      : Blue
#   295     : LDPURPLE    : Purple
#   296     : LDCYAN      : Cyan
#   297     : LDWHITE     : White
#
#
# 8 bit system
# Enter a value between 0 and 255 for the desired color.
# The default value in this case is "255" (white)
#
# 32 bit system
# Enter a value between 0 and 255 for each of the separate R, G and B vectors
# per ";".
# The default value in this case is "255;255;255" (white)
#
# Values ​​considered invalid will be reverted to the default value of each
# system.
#
#
#
# @example
#   mse_prompt_redefinePlaceHolder "PROMPT_SIGN" "4" "NONE" "LBLUE" "DWHITE"
