# Set some aliases I use

# creates baseIDX and mergeIDX branches
# git-merge-debug index base_commit merge_commit
function git-merge-debug {
    echo $args
    $idx = $args[0]
    $baseId = $args[1]
    $mergeId = $args[2]
    git br -D "base${idx}"
    git br -D "merge${idx}"
    git br "base${idx}" $baseId
    git br "merge${idx}" $mergeId
}

