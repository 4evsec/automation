function project_setup
    if test -n "$argv[1]"
        set path "$argv[1]"
    else
        set path "$PWD"
    end
    set -U CURRENT_PROJECT_PATH (realpath $path)

    set screenshot_dir "$path/$SCREENSHOT_DIRNAME"
    
    mkdir -p "$screenshot_dir" 
    set screenshot_dir_resolved (realpath "$screenshot_dir")

    if test -e "$screenshot_dir_resolved"
        defaults write com.apple.screencapture location "$screenshot_dir_resolved"
    end
    
    project_open
end
