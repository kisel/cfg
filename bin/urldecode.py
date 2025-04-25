import urllib.parse
import sys

if __name__ == "__main__":
    # Read from stdin until EOF
    encoded_string = sys.stdin.read()

    # Decode the URL-encoded string
    decoded_string = urllib.parse.unquote_plus(encoded_string)

    # Print the decoded string to stdout
    print(decoded_string)
