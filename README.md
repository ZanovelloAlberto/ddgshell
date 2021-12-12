## git directory downloader
the target of the project is provide a github tool to download your directories locally 

You can use [Github Contents API](https://developer.github.com/v3/repos/contents/#get-archive-link) to get an archive link and `tar` to retrieve a specified folder.

### Command line:

> curl https://codeload.github.com/ ***[owner]*** / ***[repo]*** /tar.gz/master | \
      tar -xz --strip=2 ***[repo]***-master/***[folder_path]***

---
**For example,**   
if you want to download [docs/](https://github.com/ZanovelloAlberto/ddgshell_/tree/master/docs) folder from [ZanovelloAlberto/ddgshell_](https://github.com/ZanovelloAlberto/ddgshell_), you can type this:   

```sh
        curl https://codeload.github.com/ZanovelloAlberto/ddgshell_/tar.gz/master | \
        tar -xz --strip=2 ddgshell_-master/docs
```

idea to see if it work: 
```sh
shell_funcion(){

}

VAR=$(python <<< "print(['uno','due','tre'])")

shell_funtion $VAR 

```