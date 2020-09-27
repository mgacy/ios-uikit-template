#!/bin/sh

# Run xcodegen to create .xcodeproj file
{%- if cookiecutter.run_xcode_gen == 'y' %}
  xcodegen
{%- endif %}

# If xcodegen has generated a .xcodeproj file we want to open it
{%- if cookiecutter.run_xcode_gen == 'y' %}
  xed .
{%- endif %}

# Set up git 
git init

# Make initial commit
# git add .
# git commit -m "chore(initial): Initial commit"

printf 'Project generation completed'