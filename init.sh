# download vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# mardown preview (vim-instant-markdown)
sudo npm install -g instant-markdown-d
mkdir -p ~/.vim/after/ftplugin/markdown/
cp instant-markdown.vim ~/.vim/after/ftplugin/markdown/

ln -s ~/.vim/vimrc ~/.vimrc
