# My Dotfiles

Use [dotter](https://github.com/SuperCuber/dotter) to deploy

`local.toml` in `.dotter/` :
```toml
packages = ["home", "config"]
```

## Dry run deploy: 
```sh
$ dotter -d deploy
```

## Deploy: 
```sh
$ dotter deploy
```
