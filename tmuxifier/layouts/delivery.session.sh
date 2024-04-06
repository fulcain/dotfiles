# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/Coding/Work/delivery"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "delivery"; then

   # Create a new window inline within session layout definition.
  new_window "source-code"
  new_window "app"

  select_window 0
  run_cmd "nvim ."
  
  select_window 1
  run_cmd "npm run dev"

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
