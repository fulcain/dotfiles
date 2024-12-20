# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "collect-nvim"; then

   # Create a new window inline within session layout definition.
   new_window "collect-nvim"
   new_window "nvim"

   select_window 1
   run_cmd "z collect"
   run_cmd "clear"
   run_cmd "nvim ."

   select_window 2
   run_cmd "z nvim"
   run_cmd "clear"
   run_cmd "nvim ."

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
