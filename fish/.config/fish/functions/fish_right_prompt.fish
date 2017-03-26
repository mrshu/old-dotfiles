function humanize_duration -d "Humanize a time interval for display"
    command awk '
        function hmTime(time,   stamp) {
            split("h:m:s:ms", units, ":")
            for (i = 2; i >= -1; i--) {
                if (t = int( i < 0 ? time % 1000 : time / (60 ^ i * 1000) % 60 )) {
                    stamp = stamp t units[sqrt((i - 2) ^ 2) + 1] " "
                }
            }
            if (stamp ~ /^ *$/) {
                return "0ms"
            }
            return substr(stamp, 1, length(stamp) - 1)
        }
        {
            print hmTime($0)
        }
    '
end

function fish_right_prompt -d "Write out the right prompt"
    set -l last_duration (echo $CMD_DURATION | humanize_duration)
    set -l current_time (date '+%T')

    set_color --bold blue
    printf "["
    set_color normal
    set_color 999
    printf "$last_duration"
    set_color --bold blue
    printf "] "
    
    set_color normal
    set_color 999
    printf "$current_time"
end
