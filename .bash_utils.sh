# install: ~/.bash_utils

# Search for word in a PDF from a folder (default in current folder)
# Example: pdfs "hallo"
# Example: pdfs "hallo" /Downloads
function pdfs {
  dir="."
  if [ "$2" ]; then
    dir="$2";
  fi
  find "$dir" -iname "*.pdf" -exec pdfgrep -inH "$1" {} \;
}
