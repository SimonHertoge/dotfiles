# Defined in - @ line 0
function yt --description 'alias yt=youtube-dl -n --all-subs --convert-subs srt --add-metadata --hls-use-mpegts --skip-unavailable-fragments'
	youtube-dl -n --all-subs --convert-subs srt --add-metadata --hls-use-mpegts --skip-unavailable-fragments $argv;
end
