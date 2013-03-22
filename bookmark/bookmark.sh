db_file="~/.bookmark"

goto_path(){
    cd `sed -n -e '$1p' ~/.bookmark`
}


bookmark_create(){
    cur=`pwd`
    if [  ]; then
	
    fi
    
    cat $db_file | gep $cur
}

alias bookmark-create="echo `pwd` > ~/.bookmark"
alias cdb="goto_path"