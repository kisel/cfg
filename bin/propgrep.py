#!/usr/bin/env python
import argparse
import subprocess

parser = argparse.ArgumentParser(
    description="A script to search in properties files"
)

parser.add_argument(
    "filter",                  # The name of the argument
    type=str,                  # The expected data type
    help="The required filter value to process the data." # Help text
)

args = parser.parse_args()
filter = args.filter


filterEscaped = filter.strip().encode("unicode-escape").decode('ascii')

grep_cmd = ["git", "grep", "-iF", filterEscaped, "--", "*.properties"]
#print(" ".join(grep_cmd))
result = subprocess.run(
            grep_cmd, 
            capture_output=True, 
            text=True, 
            check=True
        )

if result.stdout:
    for line in result.stdout.splitlines():
        print(line.encode('ascii').decode('unicode_escape'))
else:
    print("Git grep found no matches.")


#git grep -iF $(echo "Тест" | python3 -c 'import sys;print(sys.stdin.buffer.read().decode("utf-8").strip().encode("unicode-escape").decode("ascii"))' )  | python3 -c "import sys;print(sys.stdin.buffer.read().decode('unicode_escape'))" -- *.properties


