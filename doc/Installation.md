- [Back to README](../README.md)
- [User Manual](./Usage.md)
- Installation
- [Development](./Development.md)


## Preparation

We have set up the project on a Ubuntu Server 22.10.
Here are the installation instructions:

Install NPM (don't use `apt-get` since it will give you an outdated version of npm):
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
source ~/.bashrc
nvm install node npm
```

Now, install `git` and clone this repository:
```
sudo apt-get install git
git clone --recurse-submodules https://github.com/leanprover-community/lean4web.git
```

note that `--recurse-submodules` is needed to load the predefined projects in `Projects/`. (on an existing clone, you can call `git submodule init` and `git submodule update`)

## Install client

Navigate into the cloned repository, install, and
compile:
```
cd lean4web
npm install
npm run build:client
```

## Install the Lean projects

```
npm run build:server
```

## Deployment

Now the server can be started using
```
PORT=8080 npm run production
```


To set the locations of SSL certificates, use the following environment variables:
```
SSL_CRT_FILE=/path/to/crt_file.cer SSL_KEY_FILE=/path/to/private_ssl_key.pem PORT=8080 npm run production
```



### Running different projects
You can run any lean project through the webeditor by cloning them to the `Projects/` folder. See [Adding Projects](Projects/README.md) for further instructions.
