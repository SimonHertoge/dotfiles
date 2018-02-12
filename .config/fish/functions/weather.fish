# Defined in - @ line 0
function weather --description 'alias weather=curl wttr.in'
	curl wttr.in $argv;
end
