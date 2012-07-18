function pfdir;
echo "tell application \"Finder\"
    return POSIX path of (target of window 1 as alias)
    end tell" | osascript ^/dev/null;
end;