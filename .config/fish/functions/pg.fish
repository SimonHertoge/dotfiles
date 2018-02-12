# Defined in - @ line 0
function pg --description 'alias pg=ps aux | grep'
	ps aux | grep $argv;
end
