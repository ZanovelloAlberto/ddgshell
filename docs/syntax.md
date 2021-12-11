# Bash helper

## string

### percentage
When the percent sign (%) is used in the pattern ${variable%substring}, it will return content of the variable with the shortest occurrence of substring deleted from the back of the variable.

```"$(echo ${path%/*})"```

"skip the last word of a path"



### hash
```
echo "The # here does not begin a comment."
echo 'The # here does not begin a comment.'
echo The \# here does not begin a comment.
echo The # here begins a comment.

echo ${PATH#*:}       # Parameter substitution, not a comment.
echo $(( 2#101011 ))  # Base conversion, not a comment.
```




## array

### skip frist value of array

```${build_list[@]:0}``` to print all value from the fist one <br/>
```${build_list[@]:4}``` to print all value from the forth
<hr/>
<br/>


# Python helper

### get Stdin

this script will print the stdin:
> ```echo "this is the stdin" | python ./mycode.py``` <br/>
> ```this in the stdin``` <br/>

```py
import sys

#take stdin
for url in sys.stdin:
    if 'q' == url.rstrip():
        break
print(url)
```


### run Command

n all officially maintained versions of Python, the simplest approach is to use the subprocess.check_output function:

```py
> subprocess.check_output(['ls', '-l'])
b'total 0\n-rw-r--r--  1 memyself  staff  0 Mar 14 11:04 files\n'
``` 

check_output runs a single program that takes only arguments as input.1 It returns the result exactly as printed to stdout. If you need to write input to stdin, skip ahead to the run or Popen sections. If you want to execute complex shell commands, see the note on shell=True at the end of this answer.

The check_output function works in all officially maintained versions of Python. But for more recent versions, a more flexible approach is available.