

# My template
BUILD_ARGS=-h

# directories
OUTDIR=build
PYDIR=python

# FILE=$(echo ignazio)
OUT=ddgshell

define addFile =
	# PYTHON_FILE=$1
	echo $1
	echo "$($1)='" >> $(OUTDIR)/$(OUT)
	cat "./$(PYDIR)/$1.py" >> $(OUTDIR)/$(OUT)
	echo "'" >> $(OUTDIR)/$(OUT)
endef

build:
	@mkdir $(OUTDIR)
	@touch ./$(OUTDIR)/ddgshell.sh
	$(addFile test) 





install: build
	@sudo cp ./$(OUTDIR)/ddgshell.sh /usr/bin/ddgshell
	@ddgshell -h

run: build
	@./$(OUTDIR)/ddgshell.sh $(BUILD_ARGS)

clean: 
	@rm -r ./build


# echo '$(FILENAME)=cat "./python/$(FILENAME).py"'gustavo >> $(OUTDIR)/ddgshell.sh
# FILE=echo cat "./python/$(FILENAME).py"
# echo "$(FILE) ciao"
# @cp ./ddgshell.sh ./$(OUTDIR)/
# @chmod +x ./$(OUTDIR)/ddgshell.sh
# func(){
# 	$1=cat "./python/$1.py" >> $(OUTDIR)/ddgshell.sh 
# }

# #!/bin/bash
# FILE="/tmp/input.txt"
# cat $FILE