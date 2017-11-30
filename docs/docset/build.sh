#!/bin/bash

DOCSET_BASE=Tailwind.docset
TARGET_CONTENT=$DOCSET_BASE/Contents
TARGET_DOCS=$TARGET_CONTENT/Resources/Documents
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
cp $DOC_SOURCE/favicon-32x32.png $DOCSET_BASE/icon.png

# Workaround to make examples folder usable
cp -r $DOC_SOURCE/css $TARGET_DOCS/docs/
cp -r $DOC_SOURCE/img $TARGET_DOCS/docs/
cp -r $DOC_SOURCE/js $TARGET_DOCS/docs/
cp -r $DOC_SOURCE/svg $TARGET_DOCS/docs/
