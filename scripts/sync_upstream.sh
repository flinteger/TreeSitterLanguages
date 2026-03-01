#!/bin/sh
#
# This script is used to sync the upstream tree-sitter-swift grammar with the one used in this project.
#

function sync_upstream_swift() {
    rm -fr tree-sitter-swift
    mkdir -p tree-sitter-swift
    cd tree-sitter-swift
    wget https://github.com/alex-pinkus/tree-sitter-swift/releases/download/0.7.1-pypi/tree-sitter-swift.tar.gz    
    tar -xzf tree-sitter-swift.tar.gz
    cd ..
    cp -vf tree-sitter-swift/src/*.c Sources/TreeSitterSwift/src
    cp -vf tree-sitter-swift/src/tree_sitter/*.h Sources/TreeSitterSwift/src/tree_sitter/
    cp -vf bindings/swift/TreeSitterSwift/swift.h Sources/TreeSitterSwift/include/public.h
    cp -vf tree-sitter-swift/queries/locals.scm Sources/TreeSitterSwiftQueries/locals.scm
    cp -vf tree-sitter-swift/queries/highlights.scm Sources/TreeSitterSwiftQueries/highlights.scm
}

function sync_upstream() {
    sync_upstream_swift
}

sync_upstream