## Magic

### split string to array

```sh
    IFS=/ read -a arr <<< $path     
    echo "${arr[@]:4}"              #skip first 4 value then print
```