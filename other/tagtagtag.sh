#!/usr/bin/env bash

git push --delete origin v0.1
git tag --delete v0.1
git tag v0.1 -m "first tag"
git push origin v0.1
