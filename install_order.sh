#!/usr/bin/env bash

echo ""
echo "Install from bottom to top"
echo ""
sed '/^#/d' dependency_graph.txt | tsort

