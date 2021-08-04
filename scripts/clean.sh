# delete .Zone.Identifier files recursively
find . -type f -name "*:Zone.Identifier" -exec rm -f {} \;