## git directory downloader
the target of the project is provide a 

You can use [Github Contents API](https://developer.github.com/v3/repos/contents/#get-archive-link) to get an archive link and `tar` to retrieve a specified folder.

### Command line:

> curl https://codeload.github.com/ ***[owner]*** / ***[repo]*** /tar.gz/master | \
      tar -xz --strip=2 ***[repo]***-master/***[folder_path]***

---
**For example,**   
if you want to download [examples/with-apollo/](https://github.com/zeit/next.js/tree/master/examples/with-apollo) folder from [zeit/next.js](https://github.com/zeit/next.js), you can type this:   

```sh
        curl https://codeload.github.com/zeit/next.js/tar.gz/master | \
        tar -xz --strip=2 next.js-master/examples/with-apollo
```
