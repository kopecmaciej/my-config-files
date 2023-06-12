#!/bin/bash

# Copy .config filesm, exclude all folders start with legacy
rsync -av --progress --exclude 'legacy*' .config ~


