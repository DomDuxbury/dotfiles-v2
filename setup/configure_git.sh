git remote remove origin
git remote add origin git@github.com:DomDuxbury/dotfiles-v2.git

ssh-keygen -t ed25519 -C "djduxbury7@gmail.com" -f ~/.ssh/github
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github
cat ~/.ssh/github.pub
