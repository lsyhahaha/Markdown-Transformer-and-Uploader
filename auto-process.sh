demofun(){
	for file in `ls $1`
	do        
		if test -f $file
        then
			python zhihu-publisher.py --input="$file"
		fi
	done
}
path="/Users/huangrt01/Documents/GitHub/Markdown4Zhihu/Data/*.md"
demofun $path
