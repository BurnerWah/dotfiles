"""Xonsh configuration file."""

from xonsh.built_ins import XSH

env = XSH.env

env["XONSH_CACHE_EVERYTHING"] = True
env["AUTO_CD"] = True
env["ENABLE_ASYNC_PROMPT"] = True
env["XONSH_AUTOPAIR"] = True

aliases = XSH.aliases

aliases["ls"] = ("eza", "--color=auto", "--color-scale", "--classify")
aliases["la"] = (
    "eza",
    "--color=auto",
    "--color-scale",
    "--classify",
    "--long",
    "--all",
)
