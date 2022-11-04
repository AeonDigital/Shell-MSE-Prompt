#
# @desc
# Process the prompt settings as they are
# set in configuration variables and returns a prompt string
# to be visualized or already as a code to be incorporated in the use of the
# terminal.
#
# @param bool $1
# Use '0' if you just want to get a preview version of the prompt
# currently configured.
# Use '1' if you want the result obtained to be used to change
# the terminal prompt.
#
# @example
# PS1=$(mse_prompt_retrieveCode 1)