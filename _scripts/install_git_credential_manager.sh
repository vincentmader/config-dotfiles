tar -xvf ./gcmcore-linux_amd64.2.0.498.54650.tar.gz -C /usr/local/bin
git-credential-manager-core configure

git config --global credential.credentialStore plaintext
