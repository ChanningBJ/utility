#install
#  in your .bashrc , add following line:
#  source path/to/bookmark.sh
#usage:
#  bookmark-create (bcr for short)
#        will put current path into bookmark (~/.bookmark)
#  bookmark-goto   (bgo for short)
#        will print all book marks and let user choose one to cd to
#  bdel
#        will open ~/.bookmark using vi.

bookmark_db_file=$HOME/".bookmark"

bookmark-goto(){
    cat -n $bookmark_db_file
    echo -n "Input bookmark ID : "
    read id
    sed_parm=$id"p"
    cd `sed -n -e $sed_parm $bookmark_db_file`
}


bookmark-create(){
    cur=`pwd`
    if [ `cat $bookmark_db_file 2>/dev/null | grep $cur 2>/dev/null` ]; then
	echo "Current path alread in "$bookmark_db_file
    else
	if [ ! -e $bookmark_db_file ] ; then
	    touch ~/.bookmark
	fi
	echo $cur >> $bookmark_db_file
	echo "Path "$cur" is added into "$bookmark_db_file
    fi
}


alias bcr="bookmark-create"
alias bgo="bookmark-goto"
alias bdel="vi $bookmark_db_file"
