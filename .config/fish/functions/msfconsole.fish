# Defined in - @ line 0
function msfconsole --description 'alias msfconsole=msfconsole --quiet -x "db_connect user@msf"'
	command msfconsole --quiet -x "db_connect user@msf" $argv;
end
