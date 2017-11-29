#!/bin/bash

TARGET_DOCS=Tailwind.docset/Contents/Resources/Documents
TARGET_CONTENT=Tailwind.docset/Contents
DOC_SOURCE=../build_docset
DB_FILE=$TARGET_CONTENT/Resources/docSet.dsidx

rm -rf Tailwind.docset
mkdir -p $TARGET_DOCS
cp -r $DOC_SOURCE/* $TARGET_DOCS/
cp Info.plist $TARGET_CONTENT/
touch $DB_FILE
rm docs.sql
php gensql.php > docs.sql
cat docs.sql | sqlite3 $DB_FILE

