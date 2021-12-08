

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



