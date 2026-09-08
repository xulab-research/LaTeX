import ast
import tokenize
from io import StringIO
from pathlib import Path


def clean_source(path):
    with tokenize.open(path) as f:
        source = f.read()

    lines = source.splitlines(keepends=True)
    removed, string_lines = set(), set()

    for node in ast.walk(ast.parse(source)):
        if isinstance(node, ast.Expr) and isinstance(node.value, ast.Constant) and isinstance(node.value.value, str):
            segment = ast.get_source_segment(source, node.value)
            if segment and segment.lstrip("rRuUfF").startswith(('"""', "'''")):
                before = lines[node.lineno - 1].encode()[: node.col_offset]
                after = lines[node.end_lineno - 1].encode()[node.end_col_offset :].split(b"#", 1)[0]
                if not before.strip() and not after.strip():
                    removed.update(range(node.lineno, node.end_lineno + 1))

    for tok in tokenize.generate_tokens(StringIO(source).readline):
        if tok.type == tokenize.COMMENT and not lines[tok.start[0] - 1][: tok.start[1]].strip():
            removed.add(tok.start[0])
        if tok.end[0] > tok.start[0]:
            string_lines.update(range(tok.start[0], tok.end[0] + 1))

    return "".join(line for i, line in enumerate(lines, 1) if i not in removed and (line.strip() or i in string_lines))


package = Path("main/mutcleaner")
with Path("code.py").open("w", encoding="utf-8") as out:
    for path in sorted(package.rglob("*.py")):
        name = ".".join(path.relative_to(package.parent).parts)
        out.write(f"# <SOFTCOPYRIGHT_FILE: {name}>\n")
        out.write(clean_source(path))
