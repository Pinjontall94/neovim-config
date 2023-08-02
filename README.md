# My (Very Short But With LSP Support) Neovim Config

## How to get it running
Open bash and run the following: 
1. `git clone git@github.com:Pinjontall94/neovim-config.git ~/.config/nvim`
2. `nvim`

Now in neovim:
1. Ignore any errors (these are normal and expected), hit enter
2. Type `:PackerSync`, and hit [y]es when prompted
3. Watch the magic happen
4. Exit neovim with `:q!` and reopen to your new editor :)

## Language Support
LSP-Zero, which does all the heavy lifting here so I don't have to bother with
all the config details, relies on Mason. So whenever you want to install 
support for a new language or framework, simple enter `:Mason`, then scroll to
whichever tool you want and press the "i" key. Then, enter the file you want to
edit. :)

Hint: This is even easier when you filter by language! After you fire up Mason,
hit Ctrl-f
