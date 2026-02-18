# -----------------------------
# Defining modified environment variables
# -----------------------------

# set ai provider: 'copilot', 'codeium'
# for none set to empty `AI_PROVIDER=`
export AI_PROVIDER="codeium"

# set model for copilot: 'gpt-4.1', 'gpt-5.1'
# this variable is only used when `AI_PROVIDER=copilot`
export AI_COPILOT_MODEL=gpt-4.1
