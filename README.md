## git directory downloader
the target of the project is provide a github tool to download your github repo directories locally 

You can use [Github Contents API](https://developer.github.com/v3/repos/contents/#get-archive-link) to get an archive link and `tar` to retrieve a specified folder.

### Shell command to dowload repo:

this shell command get our result

```sh
curl https://codeload.github.com/ ***[owner]*** / ***[repo]*** /tar.gz/master | \
tar -xz --strip=2 ***[repo]***-master/***[folder_path]***
```


## References
### python

- [url-parameters](https://stackoverflow.com/questions/21584545)

- [url-path-sections](https://stackoverflow.com/questions/7894384/)

- [running-bash-commands](https://stackoverflow.com/questions/4256107)

- [iterate-files](https://stackoverflow.com/questions/10377998)
