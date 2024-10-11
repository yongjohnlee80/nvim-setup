## Function to shorten parent directories if path exceeds 15 characters 
shorten_path() {
    local fullpath=$PWD
    local max_length=15
    local homepath="$HOME"
    local folder_icon="📁"   # Folder icon

    # Replace /home/$USER with ~
    if [[ $fullpath == $homepath* ]]; then
        fullpath="~${fullpath#$homepath}"
    fi

    if [ ${#fullpath} -gt $max_length ]; then
        local first_part=$(echo "$fullpath" | awk -F'/' '{print $2}')   # First directory after home (~)
        local last_part=$(basename "$fullpath")                         # Last directory (current directory)
        
        # If the path is too long, shorten the middle part
        if [ "$first_part" == "~" ]; then
            local shortened="$folder_icon $first_part/…/$last_part"
        else
            local shortened="$folder_icon ~/$first_part/…/$last_part"
        fi
        echo "$shortened"
    else
        echo "$folder_icon $fullpath"  # Return the full path with folder icon
    fi
}

# Function to retrieve the current Git branch
get_git_branch() {
    # Check if we are in a git repository
    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

    if [ -n "$branch" ]; then
	    echo -e "\033[0;35m($branch )\033[00m"
    fi
}

# Disable the automatic virtual environment prefix in the prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Function to display the Python virtual environment name
get_virtualenv() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Extract only the environment name (basename of VIRTUAL_ENV)
        local venv_name=$(basename "$VIRTUAL_ENV")
        echo -e "\033[0;35m($venv_name)\033[00m "
    fi
}

PS1='┌─ ${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]$(shorten_path)\[\033[00m\] $(get_git_branch)\n└── $(get_virtualenv)[\@] \$ '

