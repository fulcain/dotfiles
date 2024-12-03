# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/Coding/linear-ml"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "linear-ml"; then


   # Create a new window inline within session layout definition.
   new_window "code"
   new_window "run"

   select_window 2
   run_cmd "source ./bin/activate"
   run_cmd "clear"

   select_window 1
   run_cmd "source ./bin/activate"
   run_cmd "clear"

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

