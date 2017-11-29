<?php

$nav = include "../navigation.php";

echo "CREATE TABLE searchIndex(id INTEGER PRIMARY KEY, name TEXT, type TEXT, path TEXT);\n";

function addPage($title, $file) {
  $fullPath = "docs/$file/index.html";
  echo "INSERT OR IGNORE INTO searchIndex(name, type, path) VALUES ('$title', 'Guide', '$fullPath');\n";
}

foreach($nav as $category) {
  foreach($category as $topic => $content) {

    // like 'extracting-components'
    if(is_string($content)) {
      addPage($topic, $content);
    }
    else {
      foreach($content as $subtopic => $filename) {
        addPage("$topic - $subtopic", $filename);
      }
    }
  }
}
