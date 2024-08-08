import subprocess
import argparse
import os
import re

parser = argparse.ArgumentParser(description="Open/Create notes")
parser.add_argument('query', nargs='*', type=str, help='note search query')

notes_dir = os.environ['NOTES']

args = parser.parse_args()
fzf_args = [
    'fzf', '-1', '-0', '--print-query',
    '--walker-skip=".*"',
    '--walker-root=' + notes_dir
]
if args.query:
    fzf_args.append('--query')
    qprefix = ""
    if len(args.query) > 1:
        qprefix = "'" # exact word match
    fzf_args.append(qprefix + ' '.join(args.query))

print(fzf_args)
result = subprocess.run(fzf_args, capture_output=True, text=True, encoding='utf-8')

if result.returncode == 0:
    print(result.stdout)

lines = result.stdout.split("\n") + ['']

userQuery = lines[0]
selNote = lines[1]

print(userQuery)
print(selNote)

if selNote == "":
    name = userQuery.replace("'", "") # remote exact match spec if any
    name = re.sub("[^x20-x7F]+", "_", name) # replace special chars
    selNote = notes_dir + f"/inbox/{name}.md"
subprocess.run(["nvim", selNote])



