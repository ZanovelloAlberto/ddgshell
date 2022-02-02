## git directory downloader
the target of the project is provide a github tool to download your github repo directories locally 

result if you run `ddghub --help`
```
usage: ddghub [-h] [-o ARG] [-v] ARG

Does a thing to some stuff, epilog = 'As an alternative to the commandline,
params can be placed in a file, one per line, and specified on the commandline
like 'ddghub @params.conf'.

positional arguments:
  ARG                   the github link of the repo/directory.

optional arguments:
  -h, --help            show this help message and exit
  -o ARG, --outdir ARG  place the output into <file>.
  -v, --verbose         increase output verbosity
```

#### Example:

- download [this directory](https://github.com/ZanovelloAlberto/subrepo-downloader/tree/master/.github/workflows): <br/>
  `ddghub github.com/ZanovelloAlberto/subrepo-downloader/tree/master/.github/workflows` 
- dowload [this diretory](https://github.com/torvalds/linux/tree/master/arch) into **"/usr/doggo"**: <br/> `ddghub -o=/usr/doggo github.com/torvalds/linux/tree/master/arch`

<br/>

Install

### Ubuntu
run into workspace dir

```
chmod +x install.sh
./install.sh
make
```

### Other distor / winows / MacOS

run into your brain
```
find -your way --how="dowload dependecies" && make
```
<br/>

## Quick alternative:

Shell command to dowload repo

```sh
curl https://codeload.github.com/$(owner)/$(repo)/tar.gz/$(branch) | \
tar -xz --strip=2 $(repo)-$(branch)/$(folder_path)
```


## References
### python

- [url-parameters](https://stackoverflow.com/questions/21584545)

- [url-path-sections](https://stackoverflow.com/questions/7894384/)

- [running-bash-commands](https://stackoverflow.com/questions/4256107)

- [iterate-files](https://stackoverflow.com/questions/10377998)
