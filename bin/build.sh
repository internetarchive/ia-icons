#!/bin/zsh -e

MYDIR=${0:a:h}

cd $MYDIR/..

cat >| test/index.html << EOF
<style>
  div {
    display: inline-block;
    width: 75px;
    padding: 5px;
    border: 1px solid gray;
    border-radius: 5px;
    vertical-align: top;
    margin: 10px 5px;
  }
</style>
<body>
EOF


for SVG in icons/*.svg; do
  BASENAME=$(basename $SVG .svg)
  OUT=src/icon-${BASENAME}.js
  echo "generating $SVG => $OUT"

  cat >| $OUT << EOF
import IAIconBase from './base.js';

class IAIcon extends IAIconBase {
  constructor() {
    super(\`
$(cat $SVG)
\`);
  }
}

customElements.define('ia-icon-$BASENAME', IAIcon);

export default IAIcon;
EOF


  cat >> test/index.html << EOF

<div>
  ia-icon-$BASENAME<hr>
  <ia-icon-$BASENAME></ia-icon-$BASENAME>
</div>
<script type="module" src="../src/icon-$BASENAME.js"></script>


EOF

done