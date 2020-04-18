demofun(){
	for file in `ls $1`
	do        
		python zhihu-publisher.py --input="$file"
	done
}
path="/Users/huangrt01/Documents/GitHub/Markdown4Zhihu/Data/*.md"
demofun $path
