case ":${PATH}:" in
  *:"$HOME/.local/bin":*) ;;
  *) echo true export PATH="$HOME/.local/bin:$PATH" ;;
esac
