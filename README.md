cfg
====
Dotfiles and common scripts

### Clone HTTPS
```
git clone https://github.com/kisel/cfg.git ~/.cfg
```

### Clone SSH
```
git clone git@github.com:kisel/cfg.git ~/.cfg
#cd ~/.cfg
#git remote add cfg-ssh git@github.com:kisel/cfg.git
```



### Bootstrap

#### Linux

```sh
bash <(curl https://raw.githubusercontent.com/kisel/cfg/refs/heads/master/bootstrap.sh)
```

or 
```sh
git clone https://github.com/kisel/cfg.git $HOME/.cfg
bash $HOME/.cfg/bootstrap.sh
```


#### Manual

```sh
cat $HOME/.cfg/bootstrap.sh
```

### Git push shortcut

```
git push git@github.com:kisel/cfg.git
```

or 
```
sh sync.sh
```


