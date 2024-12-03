# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/Projects/config-dev"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "config-dev"; then

   # Create a new window inline within session layout definition.
   new_window "dotfiles"
   new_window "setup-unix"

   select_window 1
   run_cmd "z dotfiles"
   run_cmd "clear"

   select_window 2
   run_cmd "z setup-unix"
   run_cmd "clear"

   select_window 1

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
