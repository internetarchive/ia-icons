#!/bin/zsh -e

MYDIR=${0:a:h}

cd $MYDIR/..

cat >| test/index.html << EOF
<style>
  div {
    display: inline-block;
    width: 100px;
    padding: 5px;
    border: 1px solid gray;
    border-radius: 5px;
    vertical-align: top;
    margin: 10px 5px;
  }
</style>
<body>
EOF


for SVG in svg/*.svg; do
  BASENAME=$(basename $SVG .svg)
  OUT=src/${BASENAME}.js
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


  # add the icon to the test page
  cat >> test/index.html << EOF

<div>
  &lt;ia-icon-$BASENAME/&gt;
  <hr>
  <ia-icon-$BASENAME></ia-icon-$BASENAME>
</div>
<script type="module" src="../src/$BASENAME.js"></script>


EOF

done