from xonsh.execer import Execer
from xonsh.built_ins import XSH
import subprocess

execx: Execer = XSH.builtins.execx  # ty:ignore[unresolved-attribute]

ctx = XSH.ctx
mise_init = subprocess.run(
    ["mise", "activate", "xonsh"], capture_output=True, encoding="UTF-8"
).stdout
execx(mise_init, "exec", ctx, filename="mise")
