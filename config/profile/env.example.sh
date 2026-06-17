# -----------------------------
# Defining modified environment variables
# -----------------------------

# set ai provider: 'copilot', 'codeium'
# for none set to empty `AI_PROVIDER=`
export AI_PROVIDER=codeium

# set model for copilot: 'gpt-4.1', 'gpt-5.1'
# this variable is only used when `AI_CLI_PROVIDER=copilot`
export AI_COPILOT_MODEL=gpt-4.1

# set cli provider: 'copilot', 'antigravity'
# for none set to empty `AI_CLI_PROVIDER=`
export AI_CLI_PROVIDER=copilot
