  $ source $SRC/test/helper.sh

mkrc should accept -r for a custom rcrc

  $ touch .example
  > mkdir .other-dotfiles

  $ echo 'DOTFILES_DIRS="$HOME/.other-dotfiles"' > alt-rcrc

  $ RCRC=./alt-rcrc mkrc .example
  '.example' -> '*/.other-dotfiles/example' (glob)
  '*/.example' -> '*/.other-dotfiles/example' (glob)

  $ assert_linked "$HOME/.example" "$HOME/.other-dotfiles/example"
