# configs

## conda

```shell
# Linux and macOS
cp .condarc ~/.config/conda/.condarc
```

ref: https://docs.conda.io/projects/conda/en/latest/user-guide/configuration/use-condarc.html

## Docker

```shell
# Linux
cp docker-daemon.json /etc/docker/daemon.json
sudo systemctl restart docker
```

## git

```shell
# Linux and macOS
cp .gitconfig ~/.gitconfig
```

## pip

```shell
# Linux and macOS
cp pip.conf ~/.config/pip/pip.conf
```

ref: https://pip.pypa.io/en/stable/topics/configuration/

## RStudio

Configuration for RStudio.

```shell
# Linux and macOS
cp rstudio-prefs.json ~/.config/rstudio/rstudio-prefs.json
```

ref: https://posit.co/blog/rstudio-1-3-preview-configuration/

## VS Code

```shell
# Linux
cp ./vs-code.json ~/.config/Code/User/settings.json

# macOS
cp ./vs-code.json "~/Library/Application Support/Code/User/settings.json"
```

ref: https://code.visualstudio.com/docs/configure/settings
