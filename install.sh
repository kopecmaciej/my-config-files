#!/bin/bash

# Copy .config files, exclude all folders start with legacy
rsync -av --progress --exclude 'legacy*' .config ~


