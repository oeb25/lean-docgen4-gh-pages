PROJECT := "LeanDocgen4GhPages"
PWD := "file:/" / `pwd`
DOC_FOLDER := `pwd` / "doc/"
REMOTE_URL := "https://oeb25.github.io/lean-docgen4-gh-pages/"
MATHLIB_PREFIX := "https://github.com/leanprover-community/mathlib4/blob/656765e971aeaab64e350a31d01d2e774c2bb0c8/"
MATHLIB_PRE := "file:/" / `pwd` / ".lake/packages/mathlib/"
AESOP_PREFIX := "https://github.com/leanprover-community/aesop/blob/50aaaf78b7db5bd635c19c660d59ed31b9bc9b5a/"
AESOP_PRE := "file:/" / `pwd` / ".lake/packages/aesop/"
BATTERIES_PREFIX := "https://github.com/leanprover-community/batteries/blob/bf12ff6041cbab6eba6b54d9467baed807bb2bfd/"
BATTERIES_PRE := "file:/" / `pwd` / ".lake/packages/batteries/"
PROOF_WIDGETS_PREFIX := "https://github.com/leanprover-community/batteries/blob/bf12ff6041cbab6eba6b54d9467baed807bb2bfd/"
PROOF_WIDGETS_PRE := "file:/" / `pwd` / ".lake/packages/proofwidgets/"
QQ_PREFIX := "https://github.com/leanprover-community/quote4/blob/2c8ae451ce9ffc83554322b14437159c1a9703f9/"
QQ_PRE := "file:/" / `pwd` / ".lake/packages/Qq/"
IMPORTGRAPH_PREFIX := "https://github.com/leanprover-community/import-graph/blob/fb7841a6f4fb389ec0e47dd4677844d49906af3c/"
IMPORTGRAPH_PRE := "file:/" / `pwd` / ".lake/packages/importGraph/"
LEANSEARCHCLIENT_PREFIX := "https://github.com/leanprover-community/LeanSearchClient/blob/2ba60fa2c384a94735454db11a2d523612eaabff/"
LEANSEARCHCLIENT_PRE := "file:/" / `pwd` / ".lake/packages/LeanSearchClient/"
THIS_PREFIX := "https://github.com/oeb25/lean-docgen4-gh-pages/blob/bf12ff6041cbab6eba6b54d9467baed807bb2bfd/"
THIS_PRE := "file:/" / `pwd` / ".lake/packages" / PROJECT + "/"
THIS2_PREFIX := "https://github.com/oeb25/lean-docgen4-gh-pages/blob/bf12ff6041cbab6eba6b54d9467baed807bb2bfd/"
THIS2_PRE := "file:/" / `pwd` / PROJECT + "/"

replace:
    find {{DOC_FOLDER}} -type f -exec sed -i '' 's|{{MATHLIB_PRE}}|{{MATHLIB_PREFIX}}|g' {} +
    find {{DOC_FOLDER}} -type f -exec sed -i '' 's|{{AESOP_PRE}}|{{AESOP_PREFIX}}|g' {} +
    find {{DOC_FOLDER}} -type f -exec sed -i '' 's|{{BATTERIES_PRE}}|{{BATTERIES_PREFIX}}|g' {} +
    find {{DOC_FOLDER}} -type f -exec sed -i '' 's|{{PROOF_WIDGETS_PRE}}|{{PROOF_WIDGETS_PREFIX}}|g' {} +
    find {{DOC_FOLDER}} -type f -exec sed -i '' 's|{{QQ_PRE}}|{{QQ_PREFIX}}|g' {} +
    find {{DOC_FOLDER}} -type f -exec sed -i '' 's|{{IMPORTGRAPH_PRE}}|{{IMPORTGRAPH_PREFIX}}|g' {} +
    find {{DOC_FOLDER}} -type f -exec sed -i '' 's|{{LEANSEARCHCLIENT_PRE}}|{{LEANSEARCHCLIENT_PREFIX}}|g' {} +
    find {{DOC_FOLDER}} -type f -exec sed -i '' 's|{{THIS_PRE}}|{{THIS_PREFIX}}|g' {} +
    find {{DOC_FOLDER}} -type f -exec sed -i '' 's|{{THIS2_PRE}}|{{THIS2_PREFIX}}|g' {} +
    find {{DOC_FOLDER}} -type f -exec sed -i '' 's|file://https://|https://|g' {} +

git-add:
    git add .lake/build/doc

doc:
    DOCGEN_SRC="file" lake -R -Kenv=dev build LeanDocgen4GhPages:docs
    - rm -rf doc/
    mkdir doc/
    cp -r .lake/build/doc/ doc
