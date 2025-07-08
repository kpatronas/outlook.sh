#!/usr/bin/env bash

# Read stdin into bodyText (if any)
if [ -t 0 ]; then
  bodyText=""
else
  bodyText=$(cat)
fi

# Validate attachments and build AppleScript commands
attachmentScript=""
for file in "$@"; do
  # Convert to absolute path
  absPath="$(cd "$(dirname "$file")"; pwd)/$(basename "$file")"
  if [[ ! -f "$absPath" ]]; then
    echo "Error: File not found: $file"
    exit 1
  fi
  attachmentScript+="
    make new attachment at newMessage with properties {file:(POSIX file \"$absPath\")}"
done

# Build AppleScript
osascript <<END
tell application "Microsoft Outlook"
    set newMessage to make new outgoing message with properties {subject:""}
$(if [[ -n "$bodyText" ]]; then echo "set content of newMessage to \"$(printf "%s" "$bodyText" | sed 's/"/\\"/g')\""; fi)
$attachmentScript
    open newMessage
    activate
end tell
END
