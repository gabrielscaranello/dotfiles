# -----------------------------
# Defining modified environment variables
# -----------------------------

# set ai provider: 'copilot', 'codeium'
# for none set to empty `AI_PROVIDER=`
export AI_PROVIDER=codeium

# set cli provider: 'copilot', 'antigravity', 'claude'
# for none set to empty `AI_CLI_PROVIDER=`
export AI_CLI_PROVIDER=antigravity

# set model for copilot: 'gpt-4.1', 'gpt-5.1'
# this variable is only used when `AI_CLI_PROVIDER=copilot`
export AI_CLI_COPILOT_MODEL=auto

# enable wakatime time tracking in nvim: 'true', 'false'
# for disabled set to empty `WAKATIME_ENABLED=`
export WAKATIME_ENABLED=true
