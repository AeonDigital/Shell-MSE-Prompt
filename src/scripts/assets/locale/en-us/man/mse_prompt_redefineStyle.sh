#
# @desc
# Defines the prompt style that will be used.
# The style change is done immediately but will not take effect for
# the next sessions unless the command is used
# "mse_term_savePromptConfig".
#
# If you want to return to the original session configuration use the command
# "mse_term_restorePromptSettings".
#
# @param string|int $1
# Style of prompt to use (by name or by index).
#
# @example
# mse_prompt_redefineStyle SIMPLE