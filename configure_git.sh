git config --global user.email "domduxbury@hotmail.com"
git config --global user.name "Dominic Duxbury"

git remote remove origin
git remote add origin git@github.com:DomDuxbury/dotfiles-v2.git

ssh-keygen -t ed25519 -C "domduxbury@hotmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
