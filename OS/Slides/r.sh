#!/bin/bash

# Convert PPTX files to PDF
for file in *.pptx; do
    unoconv -f pdf "$file"
done

# Remove PPTX files
rm -f *.pptx

